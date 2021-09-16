
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notice_board_page.dart';
import 'write_page_not.dart';

class DetailPagenot extends StatelessWidget {

  final int id;

  const DetailPagenot(this.id); 

  @override
  Widget build(BuildContext context) {

    String data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("공지 제목!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)),
            Divider(),
            Text("Page Number $id $data;"),
            Divider(),
            Row(
              children: [
                ElevatedButton(
                  onPressed : () { 
                    Get.off(NoticeBoardPage());
                  }, 
                  child: Text("삭제"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen[700],
                    // textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)
                    ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed : () {
                    Get.to(WritePage());
                   }, 
                  child: Text("수정"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen[700]
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text("공지 내용 " * 500 )))
          ],),
      )
    );
  }
}