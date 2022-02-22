class LoginFormModel {
  static const String userName = 'user name';
  static const String password = 'password';

  late Map<String, dynamic> initialValue;

  LoginFormModel()
      : initialValue = {
          userName: 'm.babar@gmail.com',
          password: 'babar123',
        };

  void setPayload(String user, String password) {
    initialValue = {
      userName: user,
      password: password,
    };
  }

  Map<String, dynamic> getPayload(Map<String, dynamic> values) {
    final payload = {...values};
    return payload;
  }
}
