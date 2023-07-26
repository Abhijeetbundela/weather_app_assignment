import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void setFocus(BuildContext context, {FocusNode? focusNode}) {
  FocusScope.of(context).requestFocus(focusNode ?? FocusNode());
}

void clearFocus() {
  FocusManager.instance.primaryFocus!.unfocus();
}

void showToast(String message) {
  if (message.isEmpty) return;
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    textColor: Colors.white,
    webPosition: "center",
  );
}
