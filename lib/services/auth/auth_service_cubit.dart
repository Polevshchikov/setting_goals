import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Сервис для работы с авторизацией, кубит отдает поток текущего пользователя
/// null если текущий пользователь не авторизован
class AuthServiceCubit extends Cubit<User?> {
  final FirebaseAuth firebaseAuth;

  StreamSubscription? _sub;

  AuthServiceCubit({
    required this.firebaseAuth,
  }) : super(null) {
    _sub = firebaseAuth.authStateChanges().listen((User? user) => emit(user));
  }

  /// Текущий пользователь.
  User? get currentUser => state;

  /// Авторизован ли пользователь
  bool get isAuth => currentUser != null;

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  /// Выйти
  Future signOut() async {
    await firebaseAuth.signOut();
  }

  /// Войти через почту и пароль
  Future<void> signInByEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  /// Зарегистрироваться через почту и пароль
  Future<void> signUpByEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
    checkVerification(authResult.user);
  }

  /// Обновить пользователя
  Future<void> updatePassword({required String newPassword}) async {
    if (currentUser != null) {
      var _user = currentUser!;
      await _user.updatePassword(newPassword);
    }
  }

  /// Обновить пользователя
  Future<void> updateUser({required String displayName}) async {
    if (currentUser != null) {
      var _user = currentUser!;
      await _user.updateDisplayName(displayName);
    }
  }

  /// Проверка верификации пользователя
  void checkVerification(User? user) {
    final _user = user ?? currentUser;
    if (_user != null && !_user.emailVerified) _user.sendEmailVerification();
  }
}
