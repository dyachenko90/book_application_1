import 'package:book_application_1/widgets/card_list/card_list.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {

 int _selectIndexItem = 0;

  static const List<Widget> _widgetOptions = <Widget> [
    Text('Home'),
    CardListWidget(),
    Text('Profile'),
  ];


 void onSelectTab (int index) {
  if (_selectIndexItem == index) return;

  setState(() {
    _selectIndexItem = index;
  });
 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
      body: Center(
        child: _widgetOptions[_selectIndexItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndexItem,
        backgroundColor: Colors.amberAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Caterories'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'Profile'
          ),
        ],
        onTap: onSelectTab,
      )
    );
  }
}