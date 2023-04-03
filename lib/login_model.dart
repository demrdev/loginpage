import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/authentication_service.dart';

class LoginModel extends ChangeNotifier {
  final AuthenticationService _authService;
  String? _email;
  String? _password;
  bool _isLoading = false;

  LoginModel({required AuthenticationService authService})
      : _authService = authService;

  String? get email => _email;
  String? get password => _password;
  bool get isLoading => _isLoading;

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  set password(String? value) {
    _password = value;
    notifyListeners();
  }

  Future<bool> login() async {
    _isLoading = true;
    notifyListeners();

    bool success = await _authService.login(_email ?? '', _password ?? '');

    _isLoading = false;
    notifyListeners();

    return success;
  }
}
