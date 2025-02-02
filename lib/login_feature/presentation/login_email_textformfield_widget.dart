import 'package:flutter/material.dart';
import 'package:flutter_form_strategy/helpers/debouncer.dart';

class LoginEmailTextFormFieldWidget extends StatefulWidget {
  const LoginEmailTextFormFieldWidget({super.key});

  @override
  State<LoginEmailTextFormFieldWidget> createState() =>
      _LoginEmailTextFormFieldWidgetState();
}

class _LoginEmailTextFormFieldWidgetState
    extends State<LoginEmailTextFormFieldWidget> {
  final GlobalKey<FormFieldState> emailFormFieldKey =
      GlobalKey<FormFieldState>();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  String? _olderEmailValue;

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: emailFormFieldKey,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      validator: (value) {
        String? result =
            (!_isEmptyOlderValue(_olderEmailValue)) && value!.isEmpty
                ? null
                : !isValidEmail(value)
                    ? 'Please write valid e-mail'
                    : null;
        _olderEmailValue = _isEmptyValue(value) ? value : _olderEmailValue;
        return result;
      },
      onChanged: (value) => _debouncer.run(() {
        _olderEmailValue = value.isEmpty ? _olderEmailValue : value;
        emailFormFieldKey.currentState?.validate();
      }),
    );
  }

  bool isValidEmail(String? email) {
    if (email == null) {
      return false;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool _isEmptyOlderValue(String? value) {
    return value == null || value.isEmpty;
  }

  bool _isEmptyValue(String? value) {
    return value == null || value.isEmpty;
  }
}
