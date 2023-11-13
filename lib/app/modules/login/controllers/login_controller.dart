// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';

import 'package:algologin/app/modules/home/views/home_view.dart';
import 'package:algologin/app/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  RxList userData = [].obs;

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
        var res2 = await CallApi().getData("api/users?per_page=12");
        var resultuser = json.decode(res2.body);
        userData.value = resultuser['data'];
        userData.refresh();
        debugPrint(userData.toString());
        var search = userData.where((e) => e['email'] == param['email']);
        log(search.toString());
        Get.off(() => HomeView(), arguments: search.first);
        EasyLoading.showSuccess("Welcome :) ${resultData}");
        return resultData;
      } else {
        EasyLoading.showToast("incorrect email or password!");
      }
    }
  }
}
