import 'package:setting_goals/widgets/auth/elements/form_enum.dart';

class ValidateTextForm {
  ///Валидация форм
  dynamic validateForm(
      {required String value,
      required ControllerForm formName,
      required String passwordInput}) {
    //  Проверка имени
    if (formName == ControllerForm.formName) {
      if (value == '') return 'Поле пустое, заполните его';

      return null;
    }
    //  Проверка фамилии
    if (formName == ControllerForm.formSurname) {
      if (value == '') return 'Поле пустое, заполните его';

      return null;
    }
    //  Проверка почты
    if (formName == ControllerForm.formEmail) {
      if (value == '') return 'Поле пустое, заполните его';
      if (!_validateEmail(value)) return 'Введена некорректная почта';

      return null;
    }
    //  Проверка пароля
    if (formName == ControllerForm.formPassword) {
      if (value == '') return 'Поле пустое, заполните его';
      if (value.length < 6) return 'Пароль не может быть короче 6 символов';

      return null;
    }
    //  Проверка повторного пароля
    if (formName == ControllerForm.formRepeatedPassword) {
      if (value == '') return 'Поле пустое, заполните его';
      if (value != passwordInput) return 'Пароль не совпадает';

      return null;
    }

    return null;
  }

  ///Метод валидации Email
  bool _validateEmail(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
