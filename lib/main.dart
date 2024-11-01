import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/controllers/auth_controller.dart';
import 'package:tiktok/firebase_options.dart';
import 'package:tiktok/views/screens/auth/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BindingBase.debugZoneErrorsAreFatal = true;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    Get.put(
      AuthController(),
    );
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tik Tok Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: SignUpScree(),
    );
  }
}
