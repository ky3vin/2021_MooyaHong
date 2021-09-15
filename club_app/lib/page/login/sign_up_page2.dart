import 'package:club_app/page/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


class SignUpPage2 extends StatefulWidget {
  const SignUpPage2({Key? key}) : super(key: key);

  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

   DateTime date = DateTime.now();
  
  void _showDemoPicker({
    required BuildContext context,
    required Widget child,
  }) {
    final themeData = CupertinoTheme.of(context);
    final dialogBody = CupertinoTheme(
      data: themeData,
      child: child,
    );

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => dialogBody,
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDemoPicker(
          context: context,
          child: _BottomPicker(
            child: CupertinoDatePicker(
              backgroundColor:
                  CupertinoColors.systemBackground.resolveFrom(context),
              mode: CupertinoDatePickerMode.date,
              initialDateTime: date,
              onDateTimeChanged: (newDateTime) {
                setState(() => date = newDateTime);
              },
            ),
          ),
        );
      },
      child: _Menu(children: [
        Text('생일 선택'),
        Text(
          DateFormat.yMMMMd().format(date),
          style: const TextStyle(color: CupertinoColors.inactiveGray),
        ),
      ]),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Color(0xFFF5CEB8),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 50),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: '이름 입력',
                border: OutlineInputBorder(),
                hintText: 'name',
              ),
              onSaved: (val) {},
             /*validator: (val){
              if(val?.length==null){
                return 'id 입력하세요';
              }
              return null;
            },*/
            ),
           
            
            TextFormField(
              controller: _idController,
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: '아이디 입력',
                border: OutlineInputBorder(),
                hintText: 'id',
              ),
            /*validator: (String value){
              if(value.isEmpty){
                return 'id 입력하세요'
              }
              return null;
            },*/
            ),
          
            TextFormField(
                obscureText: true, 
                controller: _passwordController,
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: "회원가입할 비밀번호를 입력해주세요",
                    border: OutlineInputBorder(),
                    hintText: 'password'),
               /* validator: (String value) {
                  if (value.isEmpty) {
                    return "비밀번호를 입력해주세요";
                  }
                  return null;
                },*/
              ),
         
           TextFormField(
                obscureText: true, 
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: "비밀번호를 한번 더 입력해주세요",
                    border: OutlineInputBorder(),
                    hintText: 'password'),
                validator: (val) {
                  if (val != _passwordController) {
                    return "비밀번호가 일치하지 않습니다.";
                  }
                  return null;
                },    //수정 필요
              ),
              
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: DefaultTextStyle(
                 style: CupertinoTheme.of(context).textTheme.textStyle,
                 child: 
                    _buildDatePicker(context),
                    
                     ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                         primary: Colors.orange, onPrimary: Colors.black),
                  onPressed: () {
                    _register();
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage())
                    );
                  },
                  child: Text('회원가입'),
                ),
              ),
                  ]
                  ))),
                  
    );
}

  void _register() async {              //firebase 연동
    /*final AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _idController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if (user == null) {
      final snackBar = SnackBar(
      content: Text("Please try again later"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  }*/
}
}


//이하 날짜선택

class _BottomPicker extends StatelessWidget {
  const _BottomPicker({
    Key ?key,
    required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
    required this.children,
  })  : assert(children != null),
        super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
        ),
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}