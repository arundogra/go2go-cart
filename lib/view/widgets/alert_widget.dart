import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class CustomAlert extends StatelessWidget{

  final String txt;
  final List<Widget>? actions;

  const CustomAlert({Key? key, required this.txt, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text(txt, style: TextStyle(color: darkGrey, fontSize: 14),),
      actions: actions
    );
  }

}