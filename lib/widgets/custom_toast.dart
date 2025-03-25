import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

class ToastManager{

  static void CustomToastError({required BuildContext context,required String title, String ?description}) {
    CherryToast.error(
    title: Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
    description: Text(description!,style:  TextStyle(fontSize: 12),textAlign:TextAlign.start ,),
    animationDuration:  const Duration(milliseconds:1000),
    toastDuration:  const Duration(milliseconds:5000),

    displayCloseButton: false,

  ).show(context);
  }

  static void CustomToastWarning({required BuildContext context,required String title, String? description})=>CherryToast.warning(
    title: Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
    description: Text(description!,style: const TextStyle(fontSize: 12),),
    animationDuration:  const Duration(milliseconds:1000),
    toastDuration:  const Duration(milliseconds:5000),
    displayCloseButton: false,

  ).show(context);

  static void CustomToastSuccess({required BuildContext context,required String title, String ?description})=>CherryToast.success(
    title: Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
    description: Text(description!,style: const TextStyle(fontSize: 12),),
    animationDuration:  const Duration(milliseconds:1000),
    toastDuration:  const Duration(milliseconds:5000),
    displayCloseButton: false,

  ).show(context);
}