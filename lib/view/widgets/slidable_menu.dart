import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../helpers/constants.dart';
import 'order_tile.dart';

class SlidableMenu {
  Widget widget(BuildContext context, int index) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: OrderTile.orderTile(
              Constants.orders[index]['img'],
              Constants.orders[index]['name'],
              Constants.orders[index]['note'],
              Constants.orders[index]['price']),),
      /*actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => _showSnackBar(context, 'Archive'),
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => _showSnackBar(context, 'Share'),
        ),
      ],*/
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.amber,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          onTap: () => _showSnackBar(context, 'More'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          foregroundColor: Colors.white,
          onTap: () => _showSnackBar(context, 'Delete'),
        ),
      ],
    );
  }

  _showSnackBar(BuildContext? context, String? s) {
    ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(content: Text(s!)));
  }
}
