//왼쪽정렬이 필요한데 안되네??
//todo detailpage route null. first, get => navigator error
import 'package:club_app/components/custsom_text_formfield.dart';
import 'package:flutter/material.dart';
//import 'package:club_app/page/board/notice_board/notice_page.dart';
//import 'package:club_app/page/board/notice_board/create_notice_page.dart';
import 'package:get/get.dart';

import 'detail_page.dart';
import 'write_page.dart';

class NoticeBoardPage extends StatefulWidget {
  const NoticeBoardPage({Key? key}) : super(key: key);

  @override
  _NoticeBoardPageState createState() => _NoticeBoardPageState();
}

class _NoticeBoardPageState extends State<NoticeBoardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   drawer: Container(
    //     width: 300,
    //     height: double.infinity,
    //     color: Colors.grey[300],
    //   ),
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text('공지사항'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.create),
          onPressed: () {
            print('create button is clicked');
            Navigator.push(context,MaterialPageRoute(builder: (context) {
              return WritePage();
              }
              ),
              );
            }
          ),
          IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            print('setting button is clicked');
            }
          ),
          ]
      ),
      body: 
       Stack(
         children: <Widget> 
          [Container(
            // Here the height of the container is 45% of our total height
            height: 1000,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8).withOpacity(0.3),
            ),
          ),
          ListView.separated(
            itemCount : 20,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () { 
                  // Get.to(DetailPage(index),arguments: "arguments 속성 테스트");
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return DetailPage(index);
                  }
                  ),
                  );
              } ,
                title: Transform(
                  transform: Matrix4.translationValues(-20, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(width: 190,child: Text('2021.09.26',style: TextStyle(fontSize: 16.0))),
                      SizedBox(height: 20,),
                      Center(child: Text('2학기 무야홍 회비 입금 안내',style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 20,),
                      Text('공지 사항 내용 '*30, style: TextStyle(fontSize: 18),),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children : <Widget>[ 
                            Divider(height: 40,),
                            Row(
                            children: <Widget> [
                              Image.asset('assets/profile.jpg',
                                  width: 40, height:40, fit: BoxFit.cover),
                              Column(
                                children:<Widget>[
                                  Padding(padding: const EdgeInsets.only(left: 4.0),
                                  child: Align(
                                    alignment: Alignment(-1.0,-1.0),
                                    child: Row(children :[ SizedBox(width: 5),Text('전지수  | 2 minutes ago',textAlign: TextAlign.start,)]))),
                                  Padding(padding: const EdgeInsets.all(4.0),
                                    child:Container(child: Align(
                                    alignment:Alignment.centerLeft,
                                    child: Text('언제까지 내야하나요??????????')))
                                    //왼쪽정렬이 필요한데 안되네??
                              )])],
                          ),
                          CustomTextFormField(hint: "Comment",funValidator: validateContent()),
                          ]
                        ),
                      )
                      
                
                      ]),
                ),
                leading: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    print("check ");
                  },
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal:0.0),
                );
              }, 
            separatorBuilder:  (context, index) {
          return Divider();
             } ,
           ),
          ]
       ),
    );
  }
}
