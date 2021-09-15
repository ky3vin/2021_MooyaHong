import 'package:flutter/material.dart';

class AlertSetting extends StatefulWidget {
  const AlertSetting({Key? key}) : super(key: key);

  @override
  _AlertSettingState createState() => _AlertSettingState();
}

class _AlertSettingState extends State<AlertSetting> {
  var _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("알림 설정하기"),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('알림 설정하기'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    Switch(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value;
                        });
                      },
                      activeColor: Color(0xFFF5CEB8),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
