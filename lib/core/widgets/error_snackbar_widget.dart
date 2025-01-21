

 import 'package:flutter/material.dart';


void showErrorBar(BuildContext context, String message,{bool isError = true}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : null,
    ),
  );
}