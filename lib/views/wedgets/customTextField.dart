import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({required this.hint,this.maxlines=1, this.onsaved, this.onchanged}) ;
  final String hint;
  final int maxlines;
 final  void Function(String?)? onsaved;
  final Function(String?)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        validator: (value){
          if(value?.isEmpty??true){
            return 'this filed is required';
          }
          else {
            return null;
          }
        },
        onSaved: onsaved

        ,
        onChanged:onchanged,
       maxLines: maxlines,
        decoration: InputDecoration(

            hintText: hint,
            helperStyle: TextStyle(color: Colors.cyan),
            enabledBorder: bulidBorder(),
            focusedBorder:  bulidBorder(Colors.cyanAccent),
            border: bulidBorder()

        ),
      ),
    );
  }
}
OutlineInputBorder bulidBorder([color]) {
  return OutlineInputBorder(

    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color?? Colors.white,

    ),


  );
}

