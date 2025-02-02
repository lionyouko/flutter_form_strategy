import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function()? onPressed;
  const LoginButtonWidget({
    super.key,
    this.onPressed,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          onPressed ?? () {};
        }
      },
      child: const Text('Login'),
    );
  }
}
