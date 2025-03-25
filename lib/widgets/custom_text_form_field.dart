import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  IconData? prefixIcon;
  IconButton? suffixIcon;
  String ?hintText;
  String? labelText;
  double?hintSize;
  bool? obscureText;
  double? labelSize;
  TextInputType? keyboardType;
  int? maxLines;
  bool?enabled;
  Color ?borderColor;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  void Function()? onTap;
  double? radius;

  CustomTextFormField(
      {super.key,
      required this.controller, this.hintText,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.validator,
      this.onChanged,
      this.hintSize,
      this.onTap,
      this.maxLines,
      this.obscureText,
      this.enabled,
      this.borderColor,
  this.labelSize,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        maxLines:maxLines??1,
        enabled:enabled ,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTap: onTap,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        validator: validator,
        textDirection: TextDirection.ltr,
        style: const TextStyle(
          color: Color(0xFF757575),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon?? suffixIcon,
          fillColor: Color(0xffF9FAFB),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(60),borderSide: BorderSide(color:borderColor??  Colors.black )),
          filled: true,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
          labelText: labelText,
          // fillColor: Colors.grey[100]!.withOpacity(0.3),
          //  filled: true,
          hintStyle: TextStyle(
            color:  Colors.black,
            fontSize: hintSize??15,
          ),
          labelStyle: TextStyle(
            color:  Colors.black,
            fontSize: labelSize??13.5,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??25),
              borderSide: BorderSide(
                 color:borderColor??  Colors.black,
              ),
              gapPadding: 5),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??25),
              borderSide: BorderSide(
                color:borderColor??  Colors.black,
              ),
              gapPadding: 5),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??25),
              borderSide: BorderSide(
                color:borderColor??  Colors.black,
              ),
              gapPadding: 5),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??25),
              borderSide: BorderSide(
                color:borderColor??  Colors.black,
              ),
              gapPadding: 5),
        ),
      ),
    );
  }
}
