import 'package:fruits_hub/core/services/firebase_auth_service.dart';

import 'package:get_it/get_it.dart';

import '../../feature/auth/data/repos/auth_repo_impl.dart';
import '../../feature/auth/domin/repo/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(
    FirebaseAuthService(),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
