import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go2go_cart/view/app/homepage.dart';
import 'package:go2go_cart/view/widgets/progress_alert.dart';
import 'view/helpers/colors.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white));

  await Firebase.initializeApp();

  runApp(const MyApp());

  ProgressView.loadingIndicator();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: white,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      builder: EasyLoading.init(),
    );
  }
}

