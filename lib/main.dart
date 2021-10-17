import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:providerexample/listpage.dart';
import 'package:providerexample/providers/spaceprovider.dart';

void main() {
  runApp(MyApp());
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<SpaceProvider>(create: (_) => SpaceProvider()),
];


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        home:ListPage(),
      ),
    );
  }
}