import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:setting_goals/services/services.dart';

/// Глобальное состояние
enum GlobalState {
  /// Инициализация (загружаются сервисы)
  Loading,

  /// Прелоадер (проверка авторизации)
  Preload,

  /// Необходимо авторизоваться (пусто)
  EmptyAuth,

  /// Загружен и пользователь есть
  Loaded,
}

class GlobalStateCubit extends BlocBase<GlobalState> {
  StreamSubscription? _streamSubsAllReady;
  StreamSubscription? _streamSubAuth;

  GlobalStateCubit() : super(GlobalState.Loading) {
    _subscribe();
  }

  @override
  Future<void> close() async {
    await _streamSubsAllReady?.cancel();
    await _streamSubAuth?.cancel();
    return super.close();
  }

  Future _subscribe() async {
    /// Ждем инициализации сервисов
    _streamSubsAllReady = getIt.allReady().asStream().listen((_) async {
      await _streamSubAuth?.cancel();

      emit(GlobalState.Preload);

      _changeUserState(getIt.get<Services>().auth.state);
      _streamSubAuth =
          getIt.get<Services>().auth.stream.listen(_changeUserState);
    });
  }

  void _changeUserState(User? user) async {
    if (user != null) {
      emit(GlobalState.Loaded);
    } else {
      /// Пользователь не авторизован
      emit(GlobalState.EmptyAuth);
    }
  }
}
