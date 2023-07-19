import 'package:meal_planet/constants/common_constants.dart';

import '../services/local_storage_service.dart';

Future saveTokenFromLoginResponse(loginResponse) async {
  await Future.wait([
    saveInSecureStorage(
      AuthConstants.accessTokenKey,
      loginResponse["payload"]["access_token"],
    ),
    saveInSecureStorage(
      AuthConstants.refreshTokenKey,
      loginResponse["payload"]["refresh_token"],
    )
  ]);
}

Future clearTokens() async {
  await Future.wait([
    saveInSecureStorage(
      AuthConstants.accessTokenKey,
      "",
    ),
    saveInSecureStorage(
      AuthConstants.refreshTokenKey,
      "",
    )
  ]);
}
