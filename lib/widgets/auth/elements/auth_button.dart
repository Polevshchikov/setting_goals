import 'package:flutter/material.dart';
import 'package:setting_goals/widgets/auth/elements/form_enum.dart';

class AuthButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isBtnEnabled;
  final FormType formType;
  const AuthButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.isBtnEnabled,
      required this.formType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.62,
      height: 38.0,
      onPressed: isBtnEnabled ? onPressed : null,
      elevation: 3,
      child: Text(
        formType == FormType.login ? 'Войти' : 'Зарегистрировать',
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
