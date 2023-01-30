import 'package:flutter/material.dart';

class AppConfig {
  BuildContext context;
  double height = 30;
  double width = 50;

  AppConfig(this.context) {
    MediaQueryData _queryData = MediaQuery.of(context);
    height = _queryData.size.height;
    width = _queryData.size.width;
  }
}
