import 'package:flutter/material.dart';

// import '../bloc/sign_in/sign_in_cubit.dart';

class intext extends StatelessWidget {
  const intext(
      {super.key, required this.text, required this.icon, this.onchanged});
  final String text;
  final Icon icon;
  final Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(60),
      elevation: 8,
      shadowColor: Colors.grey,
      child: TextFormField(
        onChanged: onchanged,
        obscureText: false,
        decoration: InputDecoration(
            fillColor: Color(0xffF9FAFB),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
            hintText: text,
            prefixIcon: icon,
            hintStyle: TextStyle(
                fontSize: 12
            ),
            ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////

class pass extends StatefulWidget {
   pass(
      {super.key, required this.text, required this.icon, this.onChanged,});
  final String text;
  final Icon icon;
  final Function(String)? onChanged;

  @override
  State<pass> createState() => _passState();
}

class _passState extends State<pass> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(60),
      elevation: 8,
      shadowColor: Colors.grey,
      child: TextFormField(
        onChanged: widget.onChanged,
        obscureText: _passwordVisible,
        decoration: InputDecoration(
            fillColor: Color(0xffF9FAFB),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
            hintText: widget.text,
            prefixIcon: widget.icon,
            hintStyle: TextStyle(
              fontSize: 12
            ),
            suffixIcon:IconButton(onPressed: (){
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            }, icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),) ),
      ),
    );
  }
}
