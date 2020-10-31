import 'package:flutter/material.dart';

import '../widgets/custom_nav_bar.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "/settings-screen";
  final int screenIndex;
  final Function setIndexCallback;

  const SettingsScreen({Key key, this.screenIndex, this.setIndexCallback})
      : super(key: key);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Settings Screen',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      bottomNavigationBar: CustomNavBar(index: widget.screenIndex, callback: widget.setIndexCallback),
    );
  }
}
