import 'package:flutter/material.dart';
import 'home_page.dart';
import 'add_Page.dart';
import 'profile_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  List<Widget> _screens = [AddPage(), HomePage(), ProfilePage()];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
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
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                ),
                label: "Add page"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              label: "Profile",
            ),
          ]),
    );
  }
}
