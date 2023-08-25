import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? colorButton;
  final TextStyle? textStyle;
  final Alignment alignment;
  const ButtonAuth({
    super.key,
    required this.text,
    this.onPressed,
    this.colorButton = const Color(0xff4631D2),
    this.textStyle,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            width: double.infinity,
            height: 60,
            child: CupertinoButton(
                // padding: const EdgeInsets.only(left: 30),
                alignment: alignment,
                color: colorButton,
                onPressed: onPressed,
                child: Text(text, style: textStyle)),
          )
        : MaterialButton(
            disabledColor: Colors.grey,
            highlightElevation: 0,
            // padding: const EdgeInsets.only(left: 30),
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            height: 60,
            minWidth: double.infinity,
            color: colorButton,
            onPressed: onPressed,
            child: Align(
              alignment: alignment,
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          );
  }
}
