import 'package:flutter/material.dart';
import 'home_page.dart';
import 'add_Page.dart';
import 'profile_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  onPageChange(int index) => createState()._switchPage(index);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  List<Widget> _screens = [AddPage(), HomePage()];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _switchPage(int index) {
    setState(() {
      _pageController.jumpToPage(index);
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey[600],
          selectedItemColor: Color(0xffF9AA33),
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: _selectedIndex == 0 ? Color(0xffF9AA33) : Colors.white,
                ),
                label: "Add "),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 1 ? Color(0xffF9AA33) : Colors.white,
              ),
              label: "Home",
            )
          ]),
    );
  }
}
