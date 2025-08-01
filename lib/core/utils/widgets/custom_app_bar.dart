import 'package:flutter/material.dart';

import '../app_text_styles.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyles.bold19,
      textAlign: TextAlign.center,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
  );
}
