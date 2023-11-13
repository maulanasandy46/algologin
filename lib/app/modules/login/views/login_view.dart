// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final c = Get.put(LoginController());
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     // title: Text('Login'),
        //     // centerTitle: true,
        //     ),
        body: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: loginForm(),
            )));
  }

  loginForm() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '  Welcome',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          SizedBox(height: 40),
          textField('email', isEmail: true),
          SizedBox(height: 15),
          textField('password', isPassword: true),
          SizedBox(height: 15),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () async {
                  var valid = _formKey.currentState!.saveAndValidate();
                  debugPrint(_formKey.currentState!.value.toString());
                  if (valid) {
                    EasyLoading.show();
                    Map data = _formKey.currentState!.value;
                    var call = await c.loginProcess(data);
                  } else {
                    EasyLoading.showToast("incorrect email or password!");
                  }
                },
                child: Container(
                    padding: EdgeInsets.all(8),
                    width: 150,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white12),
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ))),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget textField(String name,
      {bool isEmail = false, bool isPassword = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
      child: FormBuilderTextField(
        name: name,
        obscureText: isPassword,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          if (isEmail) FormBuilderValidators.email(),
        ]),
        decoration: InputDecoration(border: InputBorder.none, hintText: name),
      ),
    );
  }
}
