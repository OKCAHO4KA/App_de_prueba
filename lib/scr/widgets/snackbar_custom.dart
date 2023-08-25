import 'package:flutter/material.dart';

SnackBar sB(BuildContext context, String txt) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    backgroundColor: const Color.fromARGB(255, 45, 50, 61),
    content: Text(
      txt,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
  );
}
