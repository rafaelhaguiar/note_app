class LoginServices {
  Future<String> login(
      {required String userEmail, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return userEmail == 'user' && password == 'pass1'
          ? 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiJhYmNkMTIzIiwiZXhwaXJ5IjoxNjQ2NjM1NjExMzAxfQ.3Thp81rDFrKXr3WrY1MyMnNK8kKoZBX9lg-JwFznR-M'
          : throw Exception();
    } on Exception {
      rethrow;
    }
  }
}
