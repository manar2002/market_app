import 'package:flutter/material.dart';
import 'package:untitled/sign_up/view.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpView(),
      theme: theme,
      title: 'Nectar',
      builder: (context, child) => SafeArea(child: child!),
      debugShowCheckedModeBanner: false,
    );
  }
}