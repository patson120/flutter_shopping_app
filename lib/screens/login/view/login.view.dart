import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/routes/app_router.dart';
import 'package:shopping/screens/login/controller/login.ctrl.dart';

import 'package:flutter/cupertino.dart';
import 'package:shopping/components/custom_text_field.dart';
import 'package:shopping/core/app_colors.dart';
import 'package:shopping/core/app_sizes.dart';
import 'package:shopping/core/app_state.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LoginController>(builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: Get.height - 24,
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Spacer(),
                  const Text(
                    "Connexion",
                    style: TextStyle(
                      color: kTextColor2,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding * 3,
                  ),
                  CustomTextField(
                    onChanged: (string) {
                      print(string);
                    },
                    controller: controller.textEditingNom,
                    onTap: () {},
                    hintText: "Entrez votre nom",
                    iconData: CupertinoIcons.person_fill,
                  ),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  CustomTextField(
                    obscureText: controller.obscureText,
                    onChanged: (string) {
                      //print(string);
                    },
                    controller: controller.textEditingPassword,
                    onTap: () {
                      controller.obscureText = !controller.obscureText;
                      controller.update();
                    },
                    hintText: "Entrez votre mot de passe",
                    iconData: controller.obscureText
                        ? CupertinoIcons.eye_fill
                        : CupertinoIcons.eye_slash_fill,
                  ),
                  const SizedBox(height: kDefaultPadding * 4),
                  controller.loginStatus == LoadingStatus.searching
                      ? Container(
                          height: 45,
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: kOrangeColor,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () async {
                            //Get.toNamed(AppRoutes.HOME);
                            await controller.login(context);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: kTextColor2,
                              borderRadius:
                                  BorderRadius.circular(kDefaultRadius - 2),
                            ),
                            child: const Center(
                              child: Text(
                                "Se connecter",
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Vous n'avez pas de compte ? ",
                        style: TextStyle(
                          color: kTextColor2,
                          fontSize: 12,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.REGISTER);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Créer un compte",
                            style: TextStyle(
                              color: kOrangeColor,
                              fontSize: 12
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer()
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
