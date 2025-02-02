import 'package:flutter/material.dart';
import 'package:flutter_form_strategy/login_feature/presentation/login_button_widget.dart';
import 'package:flutter_form_strategy/login_feature/presentation/login_email_textformfield_widget.dart';
import 'package:flutter_form_strategy/login_feature/presentation/login_password_textformfield_widget.dart';

class LoginFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKeyToValidadeForm;

  const LoginFormWidget({
    super.key,
    required this.formKeyToValidadeForm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.lightBlue[50],
      child: Form(
        key: formKeyToValidadeForm,
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Icon(Icons.person, size: 150),
            const LoginEmailTextFormFieldWidget(),
            const SizedBox(height: 10),
            const LoginPasswordTextFormFieldWidget(),
            const SizedBox(height: 10),
            LoginButtonWidget(
              formKey: formKeyToValidadeForm,
            ),
          ],
        ),
      ),
    );
  }
}
