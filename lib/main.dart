import 'package:cars_trajets/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'provider/cars_provider.dart';
import 'provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigh = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(width, heigh),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiProvider(
          providers: [carsProvider, themeProvider],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: const HomePage(),
    );
  }
}
