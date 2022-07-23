import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tpt/bag/presentation/widgets/order_tile.dart';
import 'package:tpt/bag/presentation/widgets/slidable_menu.dart';
import 'package:tpt/core/drawer/custom_drawer_widget.dart';
import 'package:tpt/core/theme/AppTheme.dart';
import 'package:tpt/core/theme/theme_notifier.dart';
import 'package:tpt/core/utils/constants.dart';
import 'package:tpt/core/utils/dash_line.dart';
import 'package:tpt/core/utils/size_config.dart';
import 'package:tpt/core/utils/ticket_view.dart';

class MyBagPage extends StatefulWidget {
  MyBagPage({Key? key}) : super(key: key);

  @override
  _MyBagPageState createState() => new _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  var _darkTheme = true;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == AppTheme.darkTheme);

    return Scaffold(
      body: Stack(
        children: <Widget>[
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
                  "My Bag",
                  style: GoogleFonts.staatliches(
                    color: Colors.amber,
                    fontSize: SizeConfig.safeBlockHorizontal! * 10,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 15,
              right: 15,
              left: 15,
              child: InkWell(
                child: Container(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Check Out',
                        style: GoogleFonts.staatliches(
                          fontSize: SizeConfig.safeBlockHorizontal! * 6,
                          color: _darkTheme ? Colors.black : Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.forward,
                        color: _darkTheme ? Colors.black : Colors.white,
                      ),
                    ],
                  ),
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              elevation: _darkTheme ? 0 : 6,
              child: TicketView(
                child: Container(
                  color: Colors.white,
                  width: SizeConfig.screenWidth! / 1.2,
                  height: SizeConfig.screenHeight! / 1.4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0)),
                        ),
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          '3 Items / Total Cost 30.60',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: _darkTheme ? Colors.black : Colors.white),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: Constants.orders.length,
                            itemBuilder: (context, index) {
                              return SlidableMenu().widget(context, index);
                              /*return Dismissible(
                                key: Key(index.toString()),
                                onDismissed: (direction) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Edit It')));
                                },
                                background: Container(color: Colors.amber),
                                child: OrderTile.orderTile(
                                    Constants.orders[index]['img'],
                                    Constants.orders[index]['name'],
                                    Constants.orders[index]['note'],
                                    Constants.orders[index]['price']),
                              );*/
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const DashLine(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TOTAL',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            Text(
                              '36.60',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
