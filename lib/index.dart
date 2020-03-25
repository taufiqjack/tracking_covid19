import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_corona/home.dart';
import 'package:tracking_corona/provider/corona_provider.dart';
import 'main.dart';

void main() => runApp(MyApp());

class IndexApp extends StatelessWidget {
  const IndexApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CoronaProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kawal Corona - Taufiq Jack',
        home: Home(),
      ),
    );
  }
}
