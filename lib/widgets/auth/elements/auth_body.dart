import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setting_goals/widgets/auth/elements/auth_button.dart';
import 'package:setting_goals/widgets/auth/elements/auth_form.dart';
import 'package:setting_goals/widgets/auth/elements/form_enum.dart';
import 'package:setting_goals/widgets/navigation/navigation_widget.dart';

class BodyWidget extends StatefulWidget {
  final FormType formType;
  final TextEditingController controllerEmail;
  final TextEditingController controllerName;
  final TextEditingController controllerSurname;
  final FocusNode focusEmail;
  final FocusNode focusName;
  final FocusNode focusSurname;
  final GlobalKey formKey;
  final TextEditingController controllerPassword;
  final FocusNode focusPassword;
  final TextEditingController controllerRepeatedPassword;
  final FocusNode focusRepeatedPassword;
  final bool isBtnEnabled;
  final String passwordInput;

  const BodyWidget({
    Key? key,
    required this.formType,
    required this.controllerEmail,
    required this.formKey,
    required this.focusEmail,
    required this.controllerPassword,
    required this.focusPassword,
    required this.isBtnEnabled,
    required this.controllerRepeatedPassword,
    required this.focusRepeatedPassword,
    required this.passwordInput,
    required this.controllerName,
    required this.controllerSurname,
    required this.focusName,
    required this.focusSurname,
  }) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  bool _permissionMove = false; //  флаг, переход на след. экран
  GlobalKey<dynamic> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    formKey = widget.formKey;
  }

  //  Метод проверяющий валидацию ввода данных и в случае успеха переходим на страницу
  void _signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.reset();
      setState(() {
        _permissionMove = !_permissionMove;
      });
    } else {}
  }

  List<Widget> displayWidgets({List<Widget>? listWidgets}) {
    if (widget.formType == FormType.login) {
      return [...?listWidgets];
    } else {
      return [
        AuthFormWidget(
          controller: widget.controllerName,
          focusNode: widget.focusName,
          nextFocusNode: widget.focusSurname,
          hintText: 'Имя',
          formName: ControllerForm.formName,
        ),
        AuthFormWidget(
          controller: widget.controllerSurname,
          focusNode: widget.focusSurname,
          nextFocusNode: widget.focusEmail,
          hintText: 'Фамилия',
          formName: ControllerForm.formSurname,
        ),
        ...?listWidgets,
        AuthFormWidget(
          controller: widget.controllerRepeatedPassword,
          obscureText: true,
          focusNode: widget.focusRepeatedPassword,
          nextFocusNode: widget.focusRepeatedPassword,
          hintText: 'Повторите пароль',
          formName: ControllerForm.formRepeatedPassword,
          passwordInput: widget.passwordInput,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Card(
          elevation: 15,
          // color: Color.fromRGBO(255, 255, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ...displayWidgets(
                    listWidgets: [
                      AuthFormWidget(
                        controller: widget.controllerEmail,
                        focusNode: widget.focusEmail,
                        nextFocusNode: widget.focusPassword,
                        hintText: 'Email',
                        formName: ControllerForm.formEmail,
                      ),
                      AuthFormWidget(
                        controller: widget.controllerPassword,
                        obscureText: true,
                        focusNode: widget.focusPassword,
                        nextFocusNode: widget.formType == FormType.login
                            ? widget.focusPassword
                            : widget.focusRepeatedPassword,
                        hintText: 'Пароль',
                        formName: ControllerForm.formPassword,
                      ),
                    ],
                  ),
                  AuthButtonWidget(
                    isBtnEnabled: widget.isBtnEnabled,
                    formType: widget.formType,
                    onPressed: () {
                      _signIn();
                      if (_permissionMove) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                NavigationWidget(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
