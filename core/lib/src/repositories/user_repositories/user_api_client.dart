import 'package:core/src/common/constans.dart';
import 'package:core/src/models/model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class UserApiClient {
  static const baseUrl = ApiPaths.INTELADS_API_BASE_URL;
  static const String LOGIN_PATH = "token/generate-token";
  final http.Client httpClient = http.Client();
  Dio _httpClient = new Dio();

  Future<UserModel> login({
    @required String email,
    @required String password,
  }) async {
    final response = await _httpClient.post(
      path.join(baseUrl, LOGIN_PATH),
      queryParameters: null,
      data: {'username': email, 'password': password},
      options:
          Options(contentType: "application/json", headers: null //for test only
              ),
    );

    ///todo
    return UserModel.fromJson(response.data['result']);
  }
}
