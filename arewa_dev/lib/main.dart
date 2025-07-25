import 'package:arewa_dev/screens/home/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      
      child: MaterialApp(
        title: 'Custom Splash Demo',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

