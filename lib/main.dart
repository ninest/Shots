import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/app.dart';
import 'package:shots/app/providers/card_provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CardProvider>(create: (_) => CardProvider()),
      ],
      child: App(),
    );
  }
}
