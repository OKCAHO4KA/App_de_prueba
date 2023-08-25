import 'package:flutter/material.dart';
import 'package:proba/scr/models/response_authorization.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isHidden = true;
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  User? _user;

  User get user => _user!;
  set user(User user) {
    _user = user;
    notifyListeners();
  }

  bool get isHidden => _isHidden;
  set isHidden(bool value) {
    _isHidden = value;
    notifyListeners();
  }
}
