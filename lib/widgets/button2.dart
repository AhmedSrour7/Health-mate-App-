import 'package:flutter/material.dart';

class button2 extends StatelessWidget {
   button2({super.key, required this.text,required this.onTap});

final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  width: 340,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                    color: Color(0xff199A8E),
                    width: 2)
                  ),
                    child: Text(text,style: TextStyle(
                              color: Color(0xff199A8E),
                              fontSize: 18),),),
    );
  }
}