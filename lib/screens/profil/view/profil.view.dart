import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/screens/profil/controller/profil.ctrl.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text("Profil"),
              ),
              body: const Center(
                child: Text("Profil page"),
              ),
            ));
  }
}
