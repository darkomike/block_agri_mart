import 'package:url_strategy/url_strategy.dart';
import 'pages/pages.dart';
import 'theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriMart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(), 
      darkTheme: AppTheme.dark(),
      home: const AuthPage(),
    );
  }
}