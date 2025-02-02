import 'package:flutter/material.dart';

class LoginPasswordTextFormFieldWidget extends StatelessWidget {
  final GlobalKey<FormFieldState> passwordFormFieldKey =
      GlobalKey<FormFieldState>();
  LoginPasswordTextFormFieldWidget({super.key});

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
        passwordFormFieldKey.currentState?.validate();
      },
    );
  }
}
