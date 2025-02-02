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
        if (value == null || value.isEmpty) {
          return 'Please write a password';
        }
        return null;
      },
      onChanged: (value) {
        _debouncer.run(() => passwordFormFieldKey.currentState?.validate());
      },
    );
  }
}
