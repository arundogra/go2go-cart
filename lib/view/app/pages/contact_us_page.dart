import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tpt/bag/presentation/widgets/order_tile.dart';
import 'package:tpt/bag/presentation/widgets/slidable_menu.dart';
import 'package:tpt/contact_us/presentation/widgets/custom_map.dart';
import 'package:tpt/contact_us/presentation/widgets/text_fields.dart';
import 'package:tpt/core/drawer/custom_drawer_widget.dart';
import 'package:tpt/core/theme/AppTheme.dart';
import 'package:tpt/core/theme/theme_notifier.dart';
import 'package:tpt/core/utils/constants.dart';
import 'package:tpt/core/utils/dash_line.dart';
import 'package:tpt/core/utils/size_config.dart';
import 'package:tpt/core/utils/ticket_view.dart';

class ContactUsPage extends StatefulWidget {
  ContactUsPage({Key? key}) : super(key: key);

  @override
  _ContactUsPageState createState() => new _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
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
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 20),
                    height: SizeConfig.safeBlockHorizontal! * 70,
                    child: FutureBuilder(
                        future: Future.delayed(
                            Duration(milliseconds: 400), () => true),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator()),
                            );
                          }
                          return CustomMap().getMap(context);
                        }),
                  ),
                  MyTextFormFields.getText(
                      align: Alignment.centerLeft,
                      txtAlign: TextAlign.start,
                      margin: EdgeInsets.only(right: 15, left: 15),
                      s: 'Contact us if you need help with order',
                      style: GoogleFonts.staatliches(
                        fontSize: 27,
                      )),
                  MyTextFormFields.getText(
                      align: Alignment.centerLeft,
                      txtAlign: TextAlign.start,
                      margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                      s: 'The Pizza Tree, \n'
                          'Jodhan, Pakhowal Road, Ludhiana \n(Opp. Grewal Eye Hospital) \n'
                          'Punjab 141029',
                      style: GoogleFonts.ubuntu(
                          fontSize: 12, fontWeight: FontWeight.normal)),
                  MyTextFormFields.getText(
                      align: Alignment.centerLeft,
                      txtAlign: TextAlign.start,
                      margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                      s: '+91-7719610150 \n+91-9779323611',
                      style: GoogleFonts.ubuntu(
                          fontSize: 12, fontWeight: FontWeight.normal)),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                    child: MyTextFormFields.getForum(
                        context: context,
                        s: 'Name',
                        maxLines: 1,
                        paddig: EdgeInsets.only(left: 10),
                        style: GoogleFonts.ubuntu(fontSize: 14)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: MyTextFormFields.getForum(
                        context: context,
                        s: 'Email',
                        paddig: EdgeInsets.only(left: 10),
                        style: TextStyle(fontSize: 14)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: MyTextFormFields.getForum(
                        context: context,
                        s: 'Phone Number',
                        paddig: EdgeInsets.only(left: 10),
                        style: TextStyle(fontSize: 14)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: MyTextFormFields.getForum(
                        context: context,
                        s: 'Your question is..',
                        maxLines: 6,
                        paddig: EdgeInsets.all(10),
                        style: TextStyle(fontSize: 14)),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0)),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    width: SizeConfig.screenWidth,
                    child: Center(
                      child: Text(
                        'Submit',
                        style: GoogleFonts.staatliches(
                          fontSize: SizeConfig.safeBlockHorizontal! * 6,
                          color: _darkTheme ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  )
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
                              ? AssetImage('images/ic_menu_dark.png')
                              : AssetImage('images/ic_menu.png')),
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
                    "Contact Us",
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
