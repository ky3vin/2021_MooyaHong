import 'package:club_app/components/custom_elevated_button.dart';
import 'package:club_app/components/custom_textarea.dart';
import 'package:club_app/components/custsom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notice_board_page.dart';

class ReWritePage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>(); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text("공지글 수정")),
      body: Stack(
        children: <Widget>[
          // Container(
          //   height: 1000,
          //   decoration: BoxDecoration(
          //     color: Color(0xFFF5CEB8).withOpacity(0.3),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
            key: _formKey,
            child: ListView(
              children:[
              CustomTextFormField(
                hint: "Title", 
                funValidator: validateTitle(),
              ),
              CustomTextArea(
                hint: "Content" ,
                funValidator: validateContent(),
              ),
              CustomElevatedButton(
                text: "글 수정하기",
                funPageRoute: () {
                  if (_formKey.currentState!.validate()){
                    Get.off(NoticeBoardPage());
                  }
                },
                ),
                ]
                ),
                ),
        ),] 
      )
      );
  }
}

validateContent() {
  return (String? value){ 
    if (value!.isEmpty) {
      return "내용에는 공백이 들어갈 수 없습니다."; 
    } else if (value.length > 500) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

validateTitle() {
  return (String? value){ 
    if (value!.isEmpty) {
      return "제목에는 공백이 들어갈 수 없습니다."; 
    } else if (value.length > 30) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}
