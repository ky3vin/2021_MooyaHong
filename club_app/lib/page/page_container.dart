import 'package:club_app/page/board/ad_board/ad_board_newpage.dart';
import 'package:flutter/material.dart';
import 'package:club_app/page/board/notice_board/notice_board_page.dart';
import 'package:club_app/page/chat/chat_page.dart';
import 'package:club_app/page/home_page.dart';
import 'package:club_app/constants.dart';
import 'package:club_app/page/settings/profile_setting_page.dart';
import 'package:club_app/page/board/ad_board/ad_board_newpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    NoticeBoardPage(),
    AdBoardPagenew(),
    ProfileSetting()
  ];
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: kActiveIconColor,
          unselectedItemColor: kTextColor,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          currentIndex: _selectedIndex,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'notice',
              icon: Icon(Icons.library_books),
            ),
            BottomNavigationBarItem(
              label: 'ad',
              icon: Icon(Icons.hail),
            ),
             BottomNavigationBarItem(
              label: 'settings',
              icon: Icon(Icons.settings)
            ),
          ],
        ));
  }
}
