import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key, required this.icon,this.onPressed}) : super(key: key);
  final void Function()? onPressed;
final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,

      decoration: BoxDecoration(
          color:Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16)
      ),
      child: Center(
        child: IconButton(onPressed: onPressed,icon:Icon(icon,size: 25,)),
      ),
    );
  }
}
