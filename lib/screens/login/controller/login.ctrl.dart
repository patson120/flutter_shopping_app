// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/app_snackbar.dart';
import 'package:shopping/core/app_state.dart';
import 'package:shopping/models/request/login_model.dart';
import 'package:shopping/routes/app_router.dart';
import 'package:shopping/services/local/authentication/authentication_services.dart';
import 'package:shopping/services/local/authentication/authentication_services_impl.dart';
import 'package:shopping/services/remote/authentication/authentication.dart';

class LoginController extends GetxController {
  bool obscureText = true;
  final RemoteAuthenticationService _authService =
      RemoteAuthenticationServiceImpl();

  final LocalAuthentificationService _localAuth =
      LocalAuthentificationServiceImpl();

  LoadingStatus loginStatus = LoadingStatus.initial;

  final TextEditingController textEditingNom = TextEditingController();
  final TextEditingController textEditingPassword = TextEditingController();

  @override
  void dispose() {
    textEditingNom.dispose();
    textEditingPassword.dispose();
    super.dispose();
  }

  Future login(BuildContext context) async {
    loginStatus = LoadingStatus.searching;
    update();
    await _authService.login(
        loginReqModel: LoginRequestModel(
            expiresInMins: 60,
            username: textEditingNom.text.trim(),
            password: textEditingPassword.text.trim()),
        onLoginSuccess: (data) async {
          await _localAuth.saveToken(data.token);
          await _localAuth.saveUser(jsonEncode(data.user));
          textEditingNom.clear();
          textEditingPassword.clear();
          Get.offAllNamed(AppRoutes.HOME);
        },
        onLoginError: (error) {
          if (error.response!.statusCode == 400) {
            CustomSnacbar.showMessage(
                context, "Le champs nom ou mot de passe ne peut être vide !");
          }

          if (error.response!.statusCode == 401) {
            CustomSnacbar.showMessage(context,
                "Aucun compte actif avec pour nom '${textEditingNom.text}' et mot de passe '${textEditingPassword.text}'");
          }
          print("============ Login =============");
          print("Une erreur est survenue ${error.response!.data}");
          print(error.response!.statusCode);
          print("================================");
          loginStatus = LoadingStatus.failed;
          update();
        });
  }
}
