import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodyapp/controller/chat_controller.dart';
import 'package:foodyapp/view/pages/auth/login_page.dart';
import 'package:foodyapp/view/pages/auth/set_avatar.dart';
import 'package:foodyapp/view/pages/auth/set_bio_page.dart';
import 'package:foodyapp/view/pages/auth/sign_up.dart';
import 'package:foodyapp/view/pages/auth/verfy_page.dart';
import 'package:foodyapp/view/pages/home/bottom_navigation_bar.dart';
import 'package:foodyapp/view/pages/home/chats_page.dart';
import 'package:provider/provider.dart';

import 'controller/app_cotroller.dart';
import 'controller/auth_controller.dart';
import 'controller/home_controller.dart';
import 'controller/product_controller.dart';
import 'controller/user_controller.dart';
import 'view/pages/auth/splash_page.dart';
import 'view/pages/home/bottom_navigation_bar.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => AppController()),
        ChangeNotifierProvider(create: (context)=> ChatController()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
        builder: (context,child) {
          return  MaterialApp(
            home:BottomNB(),
          );
        }
      ),
    );
  }
}
