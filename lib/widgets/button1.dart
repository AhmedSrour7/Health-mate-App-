import 'package:flutter/material.dart';

class button extends StatelessWidget {
  button({super.key, required this.text, required this.onTap});
final String text;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color(0xff199A8E),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(text,style: TextStyle(
                              color: Colors.white,
                              fontSize: 18),),),
    );
  }
}