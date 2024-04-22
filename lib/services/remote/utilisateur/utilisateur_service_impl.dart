

import 'package:shopping/core/api_utils.dart';
import 'package:shopping/core/constants.dart';
import 'package:shopping/services/local/authentication/authentication_services.dart';
import 'package:shopping/services/local/authentication/authentication_services_impl.dart';
import 'package:shopping/services/remote/utilisateur/utilisateur.dart';

class UtilisateurServiceImpl implements UtilisateurService {
  final LocalAuthentificationService _localAuth =
      LocalAuthentificationServiceImpl();


  @override
  Future<void> getUser(
      {Function(dynamic data)? onSuccess, Function(dynamic error)? onError}) async {
        ApiRequest(
          url: "${Constants.API_URL}/user/me",
          data: {},
          token: await _localAuth.getToken(),
        ).get(
          onSuccess: (data){
            // onSuccess!(UserResponseModel.fromMap(data));
            onSuccess!(data);
          },
          onError: (error){
            if ( error != null){
              onError!(error);
            }
          }
        );
  }
}