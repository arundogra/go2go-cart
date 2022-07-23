import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';

import '../helpers/size_config.dart';
import '../theme/AppTheme.dart';
import '../theme/theme_notifier.dart';
import 'custom_drawer_widget.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var _darkTheme = true;


  @override
  Widget build(BuildContext context) {

    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == AppTheme.darkTheme);
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 20, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                fit: BoxFit.fitWidth,
                height: SizeConfig.safeBlockHorizontal! * 20,
                width: SizeConfig.safeBlockVertical! * 30,
                image: AssetImage('images/ic_logo.png'),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      //TODO CustomDrawerWidget.of(context)!.setChild(MenuPage());
                    },
                    child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 12,
                              child: Image(
                                image: _darkTheme ? const AssetImage('images/ic_pizza.png') : const AssetImage('images/ic_pizza_dark.png')
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Menu", style: AppTheme.drawerTextStyle)
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      /*CustomDrawerWidget.of(context)!.setChild(
                          MyBagPage());*/ // TODO
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 12,
                              child: Image(image: _darkTheme ? AssetImage('images/ic_bag.png') : const AssetImage('images/ic_bag_dark.png'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("My Bag", style: AppTheme.drawerTextStyle)
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      /*CustomDrawerWidget.of(context)!.setChild(
                          UpdatePage());*/ //TODO
                    },
                    child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 12,
                              child: Image(
                                image: _darkTheme ? const AssetImage(
                                    'images/ic_new.png') : AssetImage(
                                    'images/ic_new_dark.png'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Offers", style: AppTheme.drawerTextStyle)
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      /*CustomDrawerWidget.of(context)!.setChild(
                          ContactUsPage());*/ //TODO
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 12,
                              child: Image(
                                image: _darkTheme ? AssetImage('images/ic_phone.png') : AssetImage('images/ic_phone_dark.png'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Contact Us",
                                style: AppTheme.drawerTextStyle)
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      /*CustomDrawerWidget.of(context)!.setChild(
                          AboutUsPage());*/ //TODO
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 12,
                              child: Image(
                                image: _darkTheme ? const AssetImage('images/ic_info.png') : const AssetImage('images/ic_info_dark.png'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("About Us", style: AppTheme.drawerTextStyle)
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Share.share('Hey, Check out this amazing app https://play.google.com/store/apps/details?id=com.h2cabs.app', subject: 'The Pizza Tree');
                    },
                    child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 12,
                              child: Image(
                                image: _darkTheme ? AssetImage('images/ic_share.png') : AssetImage('images/ic_share_dark.png'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Share", style: AppTheme.drawerTextStyle)
                          ],
                        )),
                  ),
                ],
              ),
              DayNightSwitcher(
                dayBackgroundColor: Colors.blue[3000],
                isDarkModeEnabled: _darkTheme,
                onStateChanged: (isDarkModeEnabled) {
                  setState(() {
                    _darkTheme = isDarkModeEnabled;
                  });
                  onThemeChanged(isDarkModeEnabled, themeNotifier);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(AppTheme.darkTheme)
        : themeNotifier.setTheme(AppTheme.lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}
