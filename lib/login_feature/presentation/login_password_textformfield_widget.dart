import 'package:flutter/material.dart';
import 'package:flutter_form_strategy/helpers/debouncer.dart';

class LoginPasswordTextFormFieldWidget extends StatefulWidget {
  const LoginPasswordTextFormFieldWidget({super.key});

  @override
  State<LoginPasswordTextFormFieldWidget> createState() =>
      _LoginPasswordTextFormFieldWidgetState();
}

class _LoginPasswordTextFormFieldWidgetState
    extends State<LoginPasswordTextFormFieldWidget> {
  final GlobalKey<FormFieldState> passwordFormFieldKey =
      GlobalKey<FormFieldState>();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  String? _olderPasswordValue;

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: passwordFormFieldKey,
      obscureText: true,
      obscuringCharacter: '*',
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      validator: (value) {
        String? result =
            (!_isEmptyOlderValue(_olderPasswordValue)) && value!.isEmpty
                ? null
                : _isEmptyValue(value)
                    ? 'Please write a password'
                    : null;
        _olderPasswordValue =
            _isEmptyValue(value) ? value : _olderPasswordValue;
        return result;
      },
      onChanged: (value) {
        _debouncer.run(() {
          _olderPasswordValue = value.isEmpty ? _olderPasswordValue : value;
          passwordFormFieldKey.currentState?.validate();
        });
      },
    );
  }

  bool _isEmptyOlderValue(String? value) {
    return value == null || value.isEmpty;
  }

  bool _isEmptyValue(String? value) {
    return value == null || value.isEmpty;
  }
}
