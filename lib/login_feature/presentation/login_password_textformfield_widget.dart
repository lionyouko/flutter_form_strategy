import 'package:flutter/material.dart';

class LoginPasswordTextFormFieldWidget extends StatelessWidget {
  const LoginPasswordTextFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
