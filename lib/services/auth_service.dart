import 'package:meal_planet/constants/common_constants.dart';

import 'local_storage_service.dart';

Future<bool> isAuthorised() async {
  String? loginSessionInfo =
      await fetchStringFromSecureStorage(AuthConstants.accessTokenKey);
  return (loginSessionInfo.isNotEmpty);
}
