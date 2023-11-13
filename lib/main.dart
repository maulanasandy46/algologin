import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.login,
      getPages: AppPages.routes,
      // themeMode: ThemeMode.dark,
      builder: EasyLoading.init(),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
    ),
  );
}
