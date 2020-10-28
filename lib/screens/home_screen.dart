import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int _screenIndex = 0;

  void setIndex(index) {
    _screenIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Center(
        child:
            Text('First Screen', style: Theme.of(context).textTheme.headline1),
      ),
      Center(
        child:
            Text('Second Screen', style: Theme.of(context).textTheme.headline1),
      ),
      Center(
        child:
            Text('Third Screen', style: Theme.of(context).textTheme.headline1),
      ),
    ];

    return Scaffold(
      body: screens[_screenIndex],
      bottomNavigationBar:
          CustomNavBar(index: _screenIndex, callback: setIndex),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final int index;
  final Function callback;

  const CustomNavBar({
    Key key,
    this.index,
    this.callback,
  }) : super(key: key);
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
      currentIndex: index,
      elevation: 0,
      unselectedItemColor: Theme.of(context).accentColor,
      backgroundColor: Theme.of(context).backgroundColor,
      items: <BottomNavigationBarItem>[
        _BuildNavBarItem(Icon(Icons.timer), 'Stopwatch'),
        _BuildNavBarItem(Icon(Icons.slow_motion_video), 'Timer'),
        _BuildNavBarItem(Icon(Icons.settings), 'Settings'),
      ],
      onTap: (ind) {
        callback(ind);
      },
    ); 
  }
}
