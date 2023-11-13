// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:algologin/app/modules/home/views/home_view.dart';
import 'package:algologin/app/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future loginProcess(Map data) async {
    if (data.isNotEmpty) {
      var param = {
        'email': data['email'],
        'password': data['password'],
      };
      var res = await CallApi().postData("api/login", param);
      if (res.statusCode == 200) {
        var resultData = res.body;
        debugPrint(resultData);
        Get.offNamed('/home');
        EasyLoading.showSuccess("Welcome :) ${resultData}");
        return resultData;
      } else {
        EasyLoading.showToast("incorrect email or password!");
      }
    }
  }
}
