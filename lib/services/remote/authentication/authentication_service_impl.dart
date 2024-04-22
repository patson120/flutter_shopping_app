
import 'package:shopping/core/api_utils.dart';
import 'package:shopping/core/constants.dart';
import 'package:shopping/models/request/login_model.dart';
import 'package:shopping/models/response/token_model.dart';
import 'package:shopping/services/remote/authentication/authentication_service.dart';

class RemoteAuthenticationServiceImpl implements RemoteAuthenticationService {

  @override
  Future<void> login({
    LoginRequestModel? loginReqModel,
    Function(dynamic data)? onLoginSuccess,
    Function(dynamic error)? onLoginError}) async {
      ApiRequest(
        url: "${Constants.API_URL}/auth/login",
        data: loginReqModel!.toMap(),
      ).post(
        onSuccess: (data){
          onLoginSuccess!(TokenReponseModel.fromMap(data));
        },
        onError: (error){
          if (error != null) { onLoginError!(error);}
        }
      );
  }
}