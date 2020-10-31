import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';
import '../screens/stopwatch-screen.dart';
import '../screens/timer_screen.dart';

class CustomNavBar extends StatefulWidget {
  final int index;
  final Function callback;

  const CustomNavBar({
    Key key,
    this.index,
    this.callback,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    _BuildNavBarItem(Icon icon, String title) {
      return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
        label: title,
      );
    }

    return BottomNavigationBar(
      currentIndex: widget.index,
      elevation: 0,
      unselectedItemColor: Theme.of(context).accentColor,
      backgroundColor: Theme.of(context).backgroundColor,
      items: <BottomNavigationBarItem>[
        _BuildNavBarItem(Icon(Icons.timer), 'Stopwatch'),
        _BuildNavBarItem(Icon(Icons.slow_motion_video), 'Timer'),
        _BuildNavBarItem(Icon(Icons.settings), 'Settings'),
      ],
      onTap: (ind) {
        widget.callback(ind);

        switch (ind) {
          case 0:
            Navigator.of(context).pushReplacementNamed(StopwatchScreen.routeName);
            break;
          case 1:
            Navigator.of(context).pushReplacementNamed(TimerScreen.routeName);
            break;
          case 2:
            Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
            break;
          default:
        }
      },
    );
  }
}
