import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:club_app/widgets/Image_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      //final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imageTemporary);
    } on Exception catch (e) {
      print('이미지 설정 실패: $e');
      //todo
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      appBar: AppBar(
        title: Text('프로필 설정'),
      ),
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image(
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage('images/profilebackground.png'),
              ),
              Positioned(
                  bottom: 10,
                  child:
                
                      IconButton(
                    icon: Image.asset('images/profile.jpg'),
                    onPressed: () {
                      _getImage();
                    },
                    iconSize: 90,
                  )),
            ],
          ),
          SizedBox(height: 30.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('홍길등'),
                    onTap: () {},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text('컴퓨터공학과'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('1학년'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text('예시'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('예시'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                image != null
                    /*? ClipOval(
                      child: Image.file(
                        image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                ),
                )
                : FlutterLogo(size: 160),*/
                    ? ImageWidget(
                        image: image!, onClicked: (source) => pickImage(source))
                    : ClipOval(
                        child: Image.asset('assets/profile.jpg',
                            width: 160, height: 160, fit: BoxFit.cover),    
                      ), 
                const SizedBox(height: 24),
                Text(
                  '홍길동',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  child: Text('갤러리에서 선택'),
                  onPressed: () => pickImage(ImageSource.gallery),
                ),
                TextButton(
                  child: Text('카메라 촬영'),
                  onPressed: () => pickImage(ImageSource.camera),
                ),
                SizedBox(height: 30),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text('컴퓨터공학과'),
                    onTap: () {},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('1학년'),
                    onTap: () {},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text('예시'),
                    onTap: () {},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('예시'),
                    onTap: () {},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('예시'),
                    onTap: () {},
                  ),
                ),
                Spacer()
              ],
            ),
          )),
    );
  }
}
