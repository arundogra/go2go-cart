import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/custom_drawer_widget.dart';
import '../../helpers/constants.dart';
import '../../helpers/size_config.dart';
import '../../theme/AppTheme.dart';
import '../../theme/theme_notifier.dart';
import '../../widgets/text_fields.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  var _darkTheme = true;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == AppTheme.darkTheme);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: SizeConfig.safeBlockHorizontal! * 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      child: CachedNetworkImage(
                        fit: BoxFit.fitHeight,
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/the-pizza-tree.appspot.com/o/assets%2Fshop.jpg?alt=media&token=14949969-ea64-4bd7-9ae3-c5a8b1b18fcf',
                        placeholder: (context, url) => Container(
                            height: SizeConfig.safeBlockHorizontal! * 60,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Container(
                          height: SizeConfig.safeBlockHorizontal! * 60,
                          alignment: Alignment.center,
                          child: const Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                  ),
                  MyTextFormFields.getText(
                      align: Alignment.center,
                      txtAlign: TextAlign.center,
                      margin: const EdgeInsets.only(right: 15, left: 15, top: 20),
                      s: Constants.aboutUs,
                      style: GoogleFonts.lobster(
                        fontSize: 16,
                      )),
                  MyTextFormFields.getText(
                      align: Alignment.center,
                      txtAlign: TextAlign.center,
                      margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
                      s: '~ ❀ ~',
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              launch(
                                  "https://wa.me/+917719610150?text=Hey, There. I have an query.!!");
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: SizeConfig.safeBlockVertical! * 6,
                              child: const Image(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage('images/whatsapp.png')),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launch(
                                  'https://www.instagram.com/thepizzatreeludhiana/');
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: SizeConfig.safeBlockVertical! * 6,
                              child: Image(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage('images/instagram.png')),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launch(
                                  'https://www.facebook.com/thepizzatree.ludhiana/');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: SizeConfig.safeBlockVertical! * 6,
                              child: const Image(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage('images/facebook.png')),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Material(
                elevation: 16.0,
                type: MaterialType.transparency,
                child: GestureDetector(
                  onTap: () {
                    CustomDrawerWidget.of(context)!.open();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                          image: _darkTheme
                              ? const AssetImage('images/ic_menu_dark.png')
                              : const AssetImage('images/ic_menu.png')),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: Material(
                elevation: 16.0,
                type: MaterialType.transparency,
                child: GestureDetector(
                  onTap: () {
                    CustomDrawerWidget.of(context)!.open();
                  },
                  child: Text(
                    "About Us",
                    style: GoogleFonts.staatliches(
                      color: Colors.amber,
                      fontSize: SizeConfig.safeBlockHorizontal! * 10,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
