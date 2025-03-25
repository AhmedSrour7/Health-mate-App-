import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_mate/widgets/robotCard.dart';

class PatientHomeAiPage extends StatefulWidget {
  const PatientHomeAiPage({super.key});

  @override
  State<PatientHomeAiPage> createState() => _PatientHomeAiPageState();
}

class _PatientHomeAiPageState extends State<PatientHomeAiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F3F1),
      appBar: AppBar(
        backgroundColor:Color(0xffE8F3F1),
        centerTitle: true,
        systemOverlayStyle:  SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color(0xffE8F3F1),
          // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),

          systemNavigationBarDividerColor:  Colors.black,
          systemNavigationBarColor: Colors.black,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness:
          Brightness.light, // For iOS (dark icons)// For iOS (dark icons)
        ),
        title: Text('Robot Doctor',
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              roboDocCard(image:'assets/images/photo_2024-06-22_06-38-11.jpg', text: "Hi I'm your AI assistant!!"),
          
            ],
          ),
        ),
      ),
    );
  }
}