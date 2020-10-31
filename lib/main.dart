import 'package:flutter/material.dart';

import 'screens/settings_screen.dart';
import 'screens/stopwatch-screen.dart';
import 'screens/timer_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _screenIndex = 0;
  void _setIndex(index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.white54,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        StopwatchScreen.routeName: (context) => StopwatchScreen(screenIndex: _screenIndex, setIndexCallback: _setIndex),
        TimerScreen.routeName: (context) => TimerScreen(screenIndex: _screenIndex, setIndexCallback: _setIndex),
        SettingsScreen.routeName: (context) => SettingsScreen(screenIndex: _screenIndex, setIndexCallback: _setIndex),
      },
      home: StopwatchScreen(screenIndex: _screenIndex, setIndexCallback: _setIndex),
    );
  }
}
