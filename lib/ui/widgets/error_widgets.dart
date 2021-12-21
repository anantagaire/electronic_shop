import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget errorWidgets(BuildContext context, String message, String details){
  return AlertDialog(
    title: Text(
      message,
      style: TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.w500),
    ),
    content: Text(
      details,
      style: TextStyle(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.w500),
    ),
    actions: [
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'OK',
          style: TextStyle(
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.w700),
        ),
      )
    ],
  );
}