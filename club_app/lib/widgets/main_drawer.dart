import 'package:club_app/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:club_app/page/settings/member_management.dart';
import 'package:club_app/page/settings/my_club_page.dart';
import 'package:club_app/page/settings/profile_setting_page.dart';
import 'package:club_app/page/settings/alert_setting_page.dart';
import 'package:club_app/page/settings/edit_password.dart';
import 'package:club_app/page/login/login.dart';

class MainDrawer extends StatelessWidget {
  final drawerHeader = UserAccountsDrawerHeader(
      onDetailsPressed: (){print('name clicked');},    //삭제 필요
      decoration: BoxDecoration(
        color: Color(0xFFF5CEB8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        )),
      accountName: Text('사용자1',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20),),
      accountEmail: Text('컴퓨터공학과 1학년',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15),),
      currentAccountPicture: Container(
        child: Builder(
          builder: (context) => ClipOval(
              child: Material(
                  child: InkWell(
                    child: SizedBox(
                       child: Image.asset('assets/profile.jpg',
                       fit: BoxFit.cover) 
                          ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileSetting()),
                      );
                    },
                  ))),
        ),
      ))
      /*accountEmail:  Text(''),
      accountName: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundColor: Color(0xFFF5CEB8),
              child: Image.asset('assets/profile.jpg'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('test')
            ]
          )
        ],))사진 , 이름 가로로 정렬하는 코드*/;

  _showMessageDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('주의'),
            content: Text('로그아웃 하시겠습니까?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('아니요')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('예')),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: <Widget>[
          drawerHeader,
          /*Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  'assets/images/profile_bg_01.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeIn시ets.only(bottom: 10),
                width: 100,
                height: 100,
                child: Image.asset('assets/images/default-user.png'),
              )
            ],
          ),    drawerheader 다른 예시*/
          SizedBox(height: 30),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditPassword()),
            ),
            leading: Icon(Icons.account_circle),
            title: Text(
              '비밀번호 변경하기',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
              
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlertSetting()),
            ),
            leading: Icon(Icons.alarm),
            title: Text(
              '알림 설정하기',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyClubPage()),
            ),
            leading: Icon(Icons.favorite),
            title: Text(
              '나의 동아리 관리하기',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              '멤버 관리하기',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MemberManagement()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              '프로필 설정하기',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileSetting()),
            ),
          ),
          ListTile(
            onTap: () => _showMessageDialog(context),
            leading: Icon(Icons.exit_to_app),
            title: Text(
              '로그아웃',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
