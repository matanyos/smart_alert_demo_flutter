class User
{
  String email;
  String password;

  User({required this.email,required this.password});

  Map toJson() => {
        'Email': email,
        'Password': password,
      };
}