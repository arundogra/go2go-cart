import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go2go_cart/view/app/homepage.dart';
import 'package:go2go_cart/view/core/custom_drawer_widget.dart';
import 'package:go2go_cart/view/helpers/progress_alert.dart';
import 'package:go2go_cart/view/theme/AppTheme.dart';
import 'package:go2go_cart/view/theme/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/helpers/colors.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      runApp(
        ChangeNotifierProvider<ThemeNotifier>(
          create: (BuildContext context) => ThemeNotifier(
              darkModeOn ? AppTheme.darkTheme : AppTheme.lightTheme),
          child: MyApp(),
        ),
      );
    });
  });

  await Firebase.initializeApp();
  ProgressView.loadingIndicator();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      home: CustomDrawerWidget(
        child: MenuPage(),
      ),
    );
  }
}

