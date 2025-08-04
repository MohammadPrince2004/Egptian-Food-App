import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/HomePage.dart';
import 'package:project/LoginPage.dart';
// import 'package:project/LoginPageDesign.dart';
import 'package:project/ModeModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ChangeNotifierProvider<ModeModel>.value(
            value: ModeModel(),
            child: LoginPage(),
          ),
        );
      },
    );
  }
}
