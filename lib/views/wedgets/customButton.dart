import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,this.ontap,  this.isLoading=false}) : super(key: key);
 final void Function()? ontap;
 final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: GestureDetector(
        onTap: ontap,
        child: Container(

          height: 55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(

           gradient: LinearGradient(colors: [
             Colors.blue,Colors.cyanAccent,Colors.cyan
           ]),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Center(
            child:isLoading?CircularProgressIndicator(): Text('Add',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
