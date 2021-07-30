import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setting_goals/widgets/auth/elements/auth_body.dart';
import 'package:setting_goals/widgets/auth/elements/form_enum.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurname = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerRepeatedPassword =
      TextEditingController();
  late FocusNode _focusEmail;
  late FocusNode _focusName;
  late FocusNode _focusSurname;
  late FocusNode _focusPassword;
  late FocusNode _focusRepeatedPassword;
  FormType _formType = FormType.login;
  String _passwordInput = '';

  bool _isBtnEnabled = false; //  Флаг, активная кнопка

  @override
  void initState() {
    super.initState();
    _focusEmail = FocusNode();
    _focusName = FocusNode();
    _focusSurname = FocusNode();
    _focusPassword = FocusNode();
    _focusRepeatedPassword = FocusNode();
    _controllerPassword.addListener(() {
      setState(() {
        _isBtnEnabled = _controllerPassword.value.text.isNotEmpty;
        _passwordInput = _controllerPassword.value.text;
      });
    });
  }

  bool viewInsetsBottom(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom == 0;

  void _resetControllers() {
    setState(() {
      _controllerEmail.clear();
      _controllerName.clear();
      _controllerSurname.clear();
      _controllerPassword.clear();
      _controllerRepeatedPassword.clear();
    });
  }

  /// Смена формы
  void _switchForm() {
    setState(() {
      _formType =
          _formType == FormType.login ? FormType.register : FormType.login;
    });
  }

  @override
  void dispose() {
    _focusEmail.dispose();
    _focusName.dispose();
    _focusSurname.dispose();
    _focusPassword.dispose();
    _focusRepeatedPassword.dispose();
    _controllerEmail.dispose();
    _controllerName.dispose();
    _controllerSurname.dispose();
    _controllerPassword.dispose();
    _controllerRepeatedPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: _formType == FormType.login
                  ? Colors.greenAccent
                  : Colors.blueAccent,
            ),
            Positioned(
              left: 30,
              right: 30,
              top: viewInsetsBottom(context) ? 90 : 30,
              bottom: viewInsetsBottom(context) ? 120 : 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  viewInsetsBottom(context)
                      ? Column(
                          children: [
                            Text(
                              _formType == FormType.login
                                  ? 'Вход'
                                  : 'Регистрация',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: _formType == FormType.login ? 80.0 : 20.0,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  BodyWidget(
                    controllerName: _controllerName,
                    focusName: _focusName,
                    controllerSurname: _controllerSurname,
                    focusSurname: _focusSurname,
                    controllerEmail: _controllerEmail,
                    focusEmail: _focusEmail,
                    formKey: _formKey,
                    controllerPassword: _controllerPassword,
                    focusPassword: _focusPassword,
                    controllerRepeatedPassword: _controllerRepeatedPassword,
                    focusRepeatedPassword: _focusRepeatedPassword,
                    passwordInput: _passwordInput,
                    isBtnEnabled: _isBtnEnabled,
                    formType: _formType,
                  ),
                ],
              ),
            ),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? Positioned(
                    left: 35,
                    bottom: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_formType == FormType.login
                            ? 'Еще не зарегистрированы?'
                            : 'Уже есть аккаунт?'),
                        SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            _formKey.currentState?.reset();
                            _resetControllers();
                            _switchForm();
                          },
                          child: _formType == FormType.login
                              ? Text(
                                  'ЗАРЕГИСТРИРОВАТЬСЯ',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Text(
                                  'АВТОРИЗОВАТЬСЯ',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
