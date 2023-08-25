import 'package:proba/scr/models/response_authorization.dart';
import 'package:proba/service/api_client.dart';
// import 'package:proba/service/api_client%20copy.dart';

class Helper {
  static ResponseAuthorization? responseLoginUser;

  static Future<dynamic> loginUser(email, password) async {
    final resp = await ApiClient().loginUser(email, password);
    if (resp != null) {
      return responseLoginUser = ResponseAuthorization.fromJson(resp.data);
    }
    return null;
  }
}
