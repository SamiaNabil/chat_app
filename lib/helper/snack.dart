  import 'package:flutter/material.dart';

void snack(BuildContext context,String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content:Text(message)));
  }