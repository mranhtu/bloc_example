import 'package:core/src/models/model.dart';
import 'package:key_value_store/key_value_store.dart';
import 'package:meta/meta.dart';

import 'user_api_client.dart';

class UserRepository {
  final UserApiClient userApiClient = UserApiClient();
  static const String USER_PROFILE = 'USER_PROFILE';
  KeyValueStore keyValueStore;
  UserRepository({@required this.keyValueStore});

  Future<UserModel> login({
    @required String email,
    @required String password,
  }) async {
    final userResults =
        await userApiClient.login(email: email, password: password);
    return userResults;
  }

  Future<void> deleteToken() async {
    keyValueStore.remove(USER_PROFILE);
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    print("set key valu $token");
    keyValueStore?.setString(USER_PROFILE, token);
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    final user = keyValueStore?.getString(USER_PROFILE);
    if (user?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}
