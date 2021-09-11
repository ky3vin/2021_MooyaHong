//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:club_app/page/settings/application_page.dart';

class MemberManagement extends StatefulWidget {
  const MemberManagement({Key? key}) : super(key: key);

  @override
  _MemberManagementState createState() => _MemberManagementState();
}

class _MemberManagementState extends State<MemberManagement> {
  final memberNameController = TextEditingController();
  final members = List<String>.generate(30, (i) => "동아리원 ${i+1}");

  @override
  void initState() {
    super.initState();
    memberNameController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    memberNameController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    for (int i = 0; i < 5; i++) {
      if (memberNameController.text == members.elementAt(i))
        print("이게되네: ${memberNameController.text}"); //동아리원 검색할때 사용.수정
    }
    print("Second text field: ${memberNameController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('멤버 관리하기'),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: '동아리 멤버 검색',
                          border: InputBorder.none,
                          icon: Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Icon(Icons.search))),
                      //onChanged: (text) { print ('First text field: $text');
                      controller: memberNameController,
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('편집하기')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApplicationPage()),
                        );
                      },
                      child: Text('지원자 확인'))
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        children: [
                          for (int index = 1; index < 5; index++)
                            ListTile(
                              leading: ExcludeSemantics(
                                child: CircleAvatar(child: Text('사진')),
                              ),
                              title: Text('임원진$index'),
                              subtitle: Text('임원진$index세부정보'),
                            )
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 10,
                      indent: 20,
                      endIndent: 0,
                      width: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ListView.builder(
                        itemCount: members.length,
                        itemBuilder: (context,index) {
                          final member = members[index];

                          return Dismissible(
                            confirmDismiss: (direction) {
                              return showDialog(
                                context: context, 
                                builder: (context) => AlertDialog(
                                  title: Text('주의'),
                                  content: Text('정말로 추방하시겠습니까'),
                                  actions: <Widget> [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      }, 
                                      child: Text('아니오'),),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      }, 
                                      child: Text('예'),) 
                                  ]
                                ));
                            },
                            key: Key(member),
                            child: ListTile(
                              subtitle: Text('동아리원'),
                              title: Text('$member'),
                              leading: ExcludeSemantics(
                                child: CircleAvatar(child: Text('사진')),
                              ),)
                              ,
                            background: Container(color: Colors.red),
                            onDismissed: (direction) { 
                              setState(() {
                                members.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$member 추방되었습니다")));
                            }
                          );
                        }
                      )/*ListView(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        children: [
                          for (int index = 1; index < 20; index++)
                            ListTile(
                              leading: ExcludeSemantics(
                                child: CircleAvatar(child: Text('사진')),
                              ),
                              title: Text('동아리원$index'),
                              subtitle: Text('동아리원$index세부정보'),
                            )
                        ],
                      ),*/
                       
                    ),
                  ],
                ))
          ],
        ));
  }
}
