import 'package:flutter/material.dart';
import 'package:flutter_form_strategy/helpers/debouncer.dart';

class LoginEmailTextFormFieldWidget extends StatefulWidget {
  LoginEmailTextFormFieldWidget({super.key});

  @override
  State<LoginEmailTextFormFieldWidget> createState() =>
      _LoginEmailTextFormFieldWidgetState();
}

class _LoginEmailTextFormFieldWidgetState
    extends State<LoginEmailTextFormFieldWidget> {
  final GlobalKey<FormFieldState> emailFormFieldKey =
      GlobalKey<FormFieldState>();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

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
        if (!isValidEmail(value)) {
          return 'Please write valid e-mail';
        }
        return null;
      },
      onChanged: (value) =>
          _debouncer.run(() => emailFormFieldKey.currentState?.validate()),
    );
  }

  bool isValidEmail(String? email) {
    if (email == null) {
      return false;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
