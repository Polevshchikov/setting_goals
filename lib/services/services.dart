import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:setting_goals/services/auth/auth_service_cubit.dart';

final GetIt getIt = GetIt.instance;

/// Все глобальные сервисы
class Services {
  /// Новые сервисы
  // late AppLifeServiceCubit appLife;
  late AuthServiceCubit auth;
  // late UsernameService username;

  /// Инициализируем все сервисы
  Future<Services> init() async {
    final app = await Firebase.initializeApp();

    final firebaseAuth = FirebaseAuth.instanceFor(app: app);
    final fireStore = FirebaseFirestore.instanceFor(app: app);

    auth = AuthServiceCubit(
      firebaseAuth: firebaseAuth,
    );

    return this;
  }
}
