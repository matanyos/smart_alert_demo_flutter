class LoginCredentials {
  String email;
  String password;

  LoginCredentials({required this.email, required this.password});

  Map toJson() => {
        'Email': email,
        'Password': password,
      };
}
