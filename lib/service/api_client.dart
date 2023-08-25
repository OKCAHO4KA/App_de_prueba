import 'package:dio/dio.dart';
import 'package:proba/service/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final _dio = Dio(BaseOptions(receiveDataWhenStatusError: true));
  String baseUrl = 'http://45.10.110.181:8080';

  Future loginUser(String emailLogin, String password) async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    final parameters = <String, dynamic>{
      "email": emailLogin,
      "password": password
    };
    try {
      final response =
          await _dio.post('$baseUrl${ApiRoutes.routes["loginUser"]}',
              data: parameters,
              options: Options(
                headers: headers,
                contentType: "application/x-www-form-urlencoded",
              ));

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            "access_token", response.data['tokens']['accessToken']);
      }
      return response;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
