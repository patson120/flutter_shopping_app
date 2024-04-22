

import 'package:shopping/models/request/login_model.dart';

abstract class RemoteAuthenticationService {
  Future<void> login({
    LoginRequestModel? loginReqModel,
    Function(dynamic data)? onLoginSuccess,
    Function(dynamic error)? onLoginError,
  });
}