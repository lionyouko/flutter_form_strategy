import 'package:flutter/material.dart';
import 'package:flutter_form_strategy/login_feature/presentation/login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  final GlobalKey<FormState> formKeyToValidadeForm = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginFormWidget(
      formKeyToValidadeForm: widget.formKeyToValidadeForm,
    );
  }
}
