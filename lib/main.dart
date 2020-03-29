import 'package:covid19/constants.dart';
import 'package:covid19/providers/following_data.dart';
import 'package:covid19/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_changer.dart';

void main() => runApp(CoronaVirusApp());

class CoronaVirusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FollowingData()),
        ChangeNotifierProvider(create: (_) => ThemeChanger(kLightTheme)),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme,
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}