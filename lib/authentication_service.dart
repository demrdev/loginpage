class AuthenticationService {
  Future<bool> login(String email, String password) async {
    // Replace this with your actual authentication logic
    await Future.delayed(Duration(seconds: 1));
    return email == 'ahmed@example.com' && password == 'demir58';
  }
}
