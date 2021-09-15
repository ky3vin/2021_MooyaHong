import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyClubPage extends StatefulWidget {
  const MyClubPage({Key? key}) : super(key: key);

  @override
  _MyClubPageState createState() => _MyClubPageState();
}

enum MyClubs { club1, club2, club3, club4, club5 }
final List<String> clubs = <String>['동아리1', '동아리2', '동아리3', '동아리4', '동아리5'];


class _MyClubPageState extends State<MyClubPage> {
  MyClubs _myClubs = MyClubs.club1;

  _showMessageDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('주의'),
            content: Text('탈퇴하시겠습니까?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('아니요')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('예')),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('나의 동아리 관리'),),
        body: SafeArea(child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: 
        Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: ListView(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Text('메인 동아리 설정',
                            style:
                              TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                      ),
                      ListTile(
                          title: Text('동아리1'),
                          leading: Radio(
                            activeColor: Color(0xFFF5CEB8),
                            value: MyClubs.club1,
                            groupValue: _myClubs,
                            onChanged: (value) {
                              setState(() {
                                _myClubs = MyClubs.club1;
                                print(_myClubs);
                                Get.snackbar('동아리1', '메인동아리로 설정됨');
                              });
                            },
                          )),
                      ListTile(
                          title: Text('동아리2'),
                          leading: Radio(
                            activeColor: Color(0xFFF5CEB8), 
                            value: MyClubs.club2,
                            groupValue: _myClubs,
                            onChanged: (value) {
                              setState(() {
                                _myClubs = MyClubs.club2;
                                Get.snackbar('동아리2', '메인동아리로 설정됨');
                              });
                            },
                          )),
                      ListTile(
                          title: Text('동아리3'),
                          leading: Radio(
                            activeColor: Color(0xFFF5CEB8),
                            value: MyClubs.club3,
                            groupValue: _myClubs,
                            onChanged: (value) {
                              setState(() {
                                _myClubs = MyClubs.club3;
                                Get.snackbar('동아리3', '메인동아리로 설정됨');
                              });
                            },
                          )),
                      ListTile(
                          title: Text('동아리4'),
                          leading: Radio(
                            value: MyClubs.club4,
                            groupValue: _myClubs,
                            onChanged: (value) {
                              setState(() {
                                _myClubs = MyClubs.club4;
                                Get.snackbar('동아리4', '메인동아리로 설정됨');
                              });
                            },
                          )),
                      ListTile(
                          title: Text('동아리5'),
                          leading: Radio(
                            activeColor: Color(0xFFF5CEB8),
                            value: MyClubs.club5,
                            groupValue: _myClubs,
                            onChanged: (value) {
                              setState(() {
                                _myClubs = MyClubs.club5;
                                Get.snackbar('동아리5', '메인동아리로 설정됨');
                              });
                            },
                          ))
                    ],
                  ),
                )),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.48,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: clubs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('이름: ${clubs[index]}'),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('가입날짜: '),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 300,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFFF5CEB8),
                                    ),
                                    onPressed: () {
                                      _showMessageDialog(context);
                                    },
                                    child: Text(
                                      '탈퇴하기',
                                      style: TextStyle(color: Colors.black),),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ));
                  }),
            ),
          ],
        ),
      ),
    ),);
  }
}

SnackBar basicSnackBar() {
  return SnackBar(
    duration: Duration(seconds: 2),
    content: Text("메인동아리로 등록되었습니다"),
    action: SnackBarAction(
      onPressed: () {},
      label: "완료",
    ),
  );
}
