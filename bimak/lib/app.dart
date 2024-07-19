// ignore: depend_on_referenced_packages
import 'package:bimak/utils/constants/colors.dart';
import 'package:bimak/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/general_bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      ///Loader of Circular Progress indicator while Authetication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: MColors.primaryColor,body:Center(child: CircularProgressIndicator(color: MColors.light))),
    );
  }
}
