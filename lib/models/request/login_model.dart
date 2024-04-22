
class LoginRequestModel{
  LoginRequestModel({
    this.username, this.password
    , this.expiresInMins
  });
  final String? username;
  final String? password;
  final int? expiresInMins;
  
  Map<String, String> toMap() => {
    'username': username ?? "",
    'password': password ?? "",
    'expiresInMins': expiresInMins.toString(),
  };
}