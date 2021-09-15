import 'package:flutter/material.dart';


class EditPassword extends StatefulWidget {
  const EditPassword({ Key? key }) : super(key: key);

  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 변경하기',
           style: TextStyle(color: Colors.black),),
      ),
      
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Text('현재 비밀번호 확인'),
            SizedBox(height: 10),
            Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          hintText: '현재 비밀번호 입력',
                          border: InputBorder.none,
                          ),
                    ),
                  ),
            SizedBox(height: 20),
            Text('새 비밀번호'),
            SizedBox(height: 10),
            Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                          hintText: '새 비밀번호 입력',
                          border: InputBorder.none,
                          ),
                    ),
                  ),
            SizedBox(height: 20),
            Text('새 비밀번호 확인'),
            SizedBox(height: 10),
            Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          hintText: '새 비밀번호 확인',
                          border: InputBorder.none,
                          ),
                    ),
                  ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.4),
              child: ElevatedButton(
                onPressed: (){},
                child: Text('비밀번호 변경')),
            )
          ],),
      ),
      
    );
  }
}