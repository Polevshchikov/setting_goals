import 'package:flutter/material.dart';
import 'package:setting_goals/widgets/auth/elements/form_enum.dart';
import 'package:setting_goals/widgets/auth/elements/validate_form.dart';

class AuthFormWidget extends StatelessWidget {
  const AuthFormWidget(
      {Key? key,
      required this.controller,
      this.obscureText = false,
      required this.focusNode,
      required this.nextFocusNode,
      required this.formName,
      required this.hintText,
      this.passwordInput = ''})
      : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final String passwordInput;
  final String hintText;
  final ControllerForm formName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      focusNode: focusNode,
      style: const TextStyle(
        fontSize: 16,
      ),
      controller: controller,
      validator: (value) => ValidateTextForm().validateForm(
        value: value ?? '',
        formName: formName,
        passwordInput: passwordInput,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: const TextStyle(fontSize: 16),
        focusedBorder:
            const UnderlineInputBorder(borderSide: BorderSide(width: 1)),
        enabledBorder:
            const UnderlineInputBorder(borderSide: BorderSide(width: 1)),
      ),
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        if (focusNode != nextFocusNode) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
    );
  }
}
