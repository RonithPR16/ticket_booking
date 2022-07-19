// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ticket_booking/screens/home_screen.dart';
import 'package:ticket_booking/screens/profile_screen.dart';
import 'package:ticket_booking/screens/search_screen.dart';
import 'package:ticket_booking/screens/ticket_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    TicketScreen(),
    ProfileScreen(),
  ];
  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      // appBar: AppBar(
      //   title: Text(
      //     "Ticket booking",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      // drawer: Drawer(),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: changeScreen,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 26,
                ),
                activeIcon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                  size: 26,
                ),
                activeIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.airplane_ticket_outlined,
                  size: 26,
                ),
                activeIcon: Icon(
                  Icons.airplane_ticket,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 26,
                ),
                activeIcon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: "Profile"),
          ]),
    );
  }
}
