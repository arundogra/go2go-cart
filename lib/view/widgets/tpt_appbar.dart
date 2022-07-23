import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/custom_drawer_widget.dart';

class TptAppBar {
  static Widget getTptBar(BuildContext context, bool _darkTheme, String title) {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: -6)
              ],
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 20,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 10, left: 5),
                  child: Image(
                      image: _darkTheme
                          ? AssetImage('images/ic_backk_dark.png')
                          : AssetImage('images/ic_backk.png')),
                ),
              ),
            ),
          ),
          Material(
            elevation: 9,
            type: MaterialType.transparency,
            child: GestureDetector(
              onTap: () {
                CustomDrawerWidget.of(context)!.open();
              },
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.amber
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: -6)
              ],
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image(
                      image: _darkTheme
                          ? AssetImage('images/ic_bag_dark.png')
                          : AssetImage('images/ic_bag.png')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget getTptBarNoTitle(BuildContext context, bool _darkTheme) {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: -6)
              ],
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 20,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 10, left: 5),
                  child: Image(
                      image: _darkTheme
                          ? AssetImage('images/ic_backk_dark.png')
                          : AssetImage('images/ic_backk.png')),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: -6)
              ],
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image(
                      image: _darkTheme
                          ? AssetImage('images/ic_bag_dark.png')
                          : AssetImage('images/ic_bag.png')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
