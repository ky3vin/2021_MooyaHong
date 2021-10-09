import 'package:flutter/material.dart';
//공지글 작성 페이지 제목
class CustomTextFormField2 extends StatelessWidget {
  
  final String hint;
  final funValidator;

  const CustomTextFormField2({required this.hint, required this.funValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: funValidator,
        obscureText: hint=="Password" ? true : false,
        decoration: InputDecoration(
          hintText:"Enter $hint",
          enabledBorder: OutlineInputBorder(
            ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            ),
          ),
      ),
    );
  }
}