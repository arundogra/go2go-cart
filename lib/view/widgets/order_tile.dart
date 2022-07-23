import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/size_config.dart';

class OrderTile {
  static Widget orderTile(
          String? url, String? name, String? note, String? price) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 10),
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              width: SizeConfig.safeBlockVertical! * 10,
              imageUrl: url!,
              placeholder: (context, url) => Container(
                  height: SizeConfig.safeBlockHorizontal! * 10,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Container(
                  height: SizeConfig.safeBlockHorizontal! * 10,
                  alignment: Alignment.center,
                  child: Icon(Icons.image_not_supported)),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  note!,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  price!,
                  maxLines: 1,
                    style: GoogleFonts.montserrat(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)
                ),
              ],
            ),
          ),
          /*IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.black,
            ),
            onPressed: () {},
          )*/
        ],
      );
}
