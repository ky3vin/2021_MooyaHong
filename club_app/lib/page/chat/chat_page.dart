import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

final ThemeData kIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);

final ThemeData kDefaultTheme = ThemeData(
    primarySwatch: Colors.purple, accentColor: Colors.orangeAccent[400]);

/*class ChatApp extends StatelessWidget {
  const ChatApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(defaultTargetPlatform);
    return  MaterialApp(
      title: 'chat',
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      home:ChatScreen()
      );
  }
}MaterialApp사용하면 화면전환 오류뜸*/

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static final route = 'ChatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  bool _isComposing = false;

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
      super.dispose();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('단체채팅방'),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          )
        ],
      ),
      endDrawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            child: Text('동아리원1'),
            decoration: BoxDecoration(color: Color(0xFFF5CEB8),),
          ),
          ListTile(
            title: Text("Item 1"),
            onTap: () {
              print("item 1!!");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Item 2"),
          ),
          ListTile(
            title: Text("Item 3"),
          ),
        ]),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0.8),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _textEditingController,
                    onSubmitted: _handleSubmitted,
                    onChanged: (String text) {
                      setState(() {
                        _isComposing = text.length > 0;
                      });
                    },
                    decoration: InputDecoration.collapsed(hintText: '메시지 입력'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.4),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? CupertinoButton(
                          child: Text("send"),
                          onPressed: _isComposing
                              ? () =>
                                  _handleSubmitted(_textEditingController.text)
                              : null)
                      : IconButton(
                          icon: Icon(Icons.send),
                          onPressed: _isComposing
                              ? () =>
                                  _handleSubmitted(_textEditingController.text)
                              : null,
                        ),
                )
              ],
            )));
  }

  _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
    });

    ChatMessage message = ChatMessage(
      text,
      AnimationController(duration: Duration(milliseconds: 700), vsync: this),
    ); //수정
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}

const String name = "chang";

class ChatMessage extends StatelessWidget {
  final AnimationController animationController;
  final String text;
  ChatMessage(this.text, this.animationController); //좀 다름

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      axisAlignment: 0.0,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  child: Text(name[0]),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,
                      style: Theme.of(context).textTheme.subtitle1), //조금바꿈
                  Container(
                      margin: EdgeInsets.only(top: 5.0), child: Text(text))
                ],
              ))
            ],
          )),
    );
  }
}
