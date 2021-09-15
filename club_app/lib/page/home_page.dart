import 'package:flutter/material.dart';
import 'package:club_app/page/board/notice_board/notice_board_page.dart';
import 'package:club_app/page/chat/chat_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:club_app/widgets/main_drawer.dart';
import 'package:club_app/constants.dart';
import 'package:club_app/page/settings/my_club_page.dart';


//import 'package:get/route_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final route = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(child: Scaffold(
      /*appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/club_logo2.png',
              fit: BoxFit.contain,
              height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('test')
              )
          ],
        ),
      ),*/
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget> [
         
         Container(
            height: MediaQuery.of(context).size.height *0.4,
            decoration: BoxDecoration(
                  color: Color(0xFFF5CEB8), 
                  /*image: DecorationImage(
                    image:AssetImage('assets/club_logo2.png'),
                    alignment: Alignment.center,

                    )*/)),
         SafeArea(
           child: Padding(
             padding: const EdgeInsets.only(top: 30,left: 30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Container(
                     alignment: Alignment.center,height:125,width: 125,
                     child:ClipOval(
                      child: Image.asset('assets/club_logo.jpeg'
                      ,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                   )),
                     ),
                  SizedBox(width: 20),
                  Container(
                   padding: EdgeInsets.only(left: 10),
                   margin: EdgeInsets.only(top: 10, bottom: 10),
                   height: 100,
                   width: 170,
                   child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('TEAM401',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,)),
                              Text(' 스노우보드 동아리',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
                              Text(' 동아리원 - 30'),
                              Text(' 임원진 - 회장')
                            ],
                          )
                  )
                 ],
             ),)),
             /*SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 180),  //메인동아리 설정방법 결정해야함
             child: Align(alignment: Alignment.topRight,child: SelectClub()),)),*/
             SafeArea(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 120),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Align(
                       alignment: Alignment.topRight,
                       child: IconButton(
                         icon: Icon(Icons.autorenew,),
                         onPressed: (){
                           Navigator.push(
                           context,
                           MaterialPageRoute(
                            builder: (context) => MyClubPage()));
                         },
                         
                       )
                     )
                   ],
                 ))),
      /*Container(
        decoration: BoxDecoration(color: kBackgroundColor,),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:AssetImage('assets/club_logo.jpeg',
      
                     )),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),)),
              ),
            ],
          ),*/
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              children: [
               

                _pageOfMyClub2(),
   
                SizedBox(height: 30),
                example2(),
                example(),
                example(),
                example(),
                example(),],),
          )
          
        ]),
    ),
     onWillPop: ()async{
    return false;},);
  }
}

Widget _pageOfTop() {
  return Padding(padding: EdgeInsets.only(top: 50.0));
}

/*Widget _pageOfMyClub() {
  String selectedClub = '동아리 1';

  void selectClub( BuildContext context,String value){
    selectedClub = value;
  }

  return Container(
    child: //Builder(builder: (context)=>
     Row(children: <Widget>[
      PopupMenuButton(
        onSelected: (value) => selectClub(context,selectedClub),
        padding: EdgeInsets.only(right: 8.0),
        offset: Offset(-16, 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border:Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              )),
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 120.0),
          child: Text(
            selectedClub,
            style: TextStyle(color: Colors.black),
          ),
        ),
        itemBuilder: (context) => <PopupMenuItem<String>>[
          new PopupMenuItem<String>(
              child: Row(
                children: <Widget>[SizedBox(width: 80),Icon(Icons.arrow_right), Text('동아리 1'), SizedBox(width: 80)],
              ),
              value: '1'),
              PopupMenuItem(child: Row(
                children: <Widget>[SizedBox(width: 80),Icon(Icons.arrow_right), Text('동아리 2'), SizedBox(width: 80)],
              ),
              value: '2',),
              PopupMenuItem(child: Row(
                children: <Widget>[SizedBox(width: 80),Icon(Icons.arrow_right), Text('동아리 3'), SizedBox(width: 80)],
              ),
              value: '3',),
        ],
      ),
    ]),
  );
}
*/

Widget _pageOfMyClub2() {
  return CarouselSlider(
    options: CarouselOptions(
        height: 200.0, autoPlay: true, autoPlayInterval: Duration(seconds: 3)),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return InkWell(
            onTap: (){
              if(i==1){
                Navigator.push(
                           context,
                           MaterialPageRoute(
                            builder: (context) => MyClubPage())); //배너 각자 설정하는법관련 수정필요

            }},
            child:Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: kActiveIconColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                '배너 $i',
                style: TextStyle(fontSize: 16.0),
              )));
        },
      );
    }).toList(),
  );
}

Widget _pageOfMiddle() {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Builder(
        builder: (context) => Container(
          width: 100,
          height: 100,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoticeBoardPage()),
                );
              },
              child: Text('공지사항')),
        ),
      ),
      SizedBox(width: 50),
      Builder(
        builder: (context) => Container(
          width: 100,
          height: 100,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange, onPrimary: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Text('채팅')),
        ),
      )
    ],
  ));
}

Widget example() {
  return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(5),
          color: kBackgroundColor),
  
      child: Text('예시'));
}


Widget example2() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
    ),
    elevation: 4,
    child: Container(
      padding: EdgeInsets.all(20),
      width: 200,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('공지사항',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,)),
        Text(' 공지사항입니다',style: TextStyle(fontSize: 15)),
        Text(' 공지사항입니다',style: TextStyle(fontSize: 15)),
        Text(' 공지사항입니다',style: TextStyle(fontSize: 15)),
        Text(' 공지사항입니다',style: TextStyle(fontSize: 15))
        
      ],)
    ),
    
  );
}

class SelectClub extends StatefulWidget {
  const SelectClub({Key? key}) : super(key: key);

  @override
  _SelectClubState createState() => _SelectClubState();
}

class _SelectClubState extends State<SelectClub> {
  String _selectedClub = '동아리 선택';

  void selectClub(BuildContext context, String value) {
    setState(() {
      _selectedClub = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedClub = '동아리 변경';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: //Builder(builder: (context)=>
          Row(children: <Widget>[
        PopupMenuButton(
          initialValue: _selectedClub,
          onSelected: (value) => selectClub(context, _selectedClub),
          padding: EdgeInsets.only(right: 8.0),
          offset: Offset(-16, 20),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
               ),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Text(
              _selectedClub,
              style: TextStyle(color: Colors.black),
            ),
          ),
          itemBuilder: (context) => <PopupMenuItem<String>>[
            new PopupMenuItem<String>(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 80),
                    Icon(Icons.arrow_right),
                    Text('동아리 1'),
                    SizedBox(width: 80)
                  ],
                ),
                value: '1'),
            PopupMenuItem(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 80),
                  Icon(Icons.arrow_right),
                  Text('동아리 2'),
                  SizedBox(width: 80)
                ],
              ),
              value: '2',
            ),
            PopupMenuItem(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 80),
                  Icon(Icons.arrow_right),
                  Text('동아리 3'),
                  SizedBox(width: 80)
                ],
              ),
              value: '3',
            ),
          ],
        ),
      ]),
    );
  }
}
