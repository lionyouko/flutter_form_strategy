import 'package:flutter/material.dart';

class LoginEmailTextFormFieldWidget extends StatelessWidget {
  const LoginEmailTextFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      validator: (value) {
        if (!isValidEmail(value)) {
          return 'Please write valid e-mail';
        }
        return null;
      },
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
