import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notsapp/views/wedgets/customSearchIcon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon, this.onPressed}) : super(key: key);
   final String title;
   final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16,vertical: 30 ),
      child: Row(
        children: [
          Text(title,style: TextStyle(fontSize: 30),),
          Spacer(),
          CustomSearchIcon(icon: icon,onPressed: onPressed,)

        ],
      ),
    );
  }
}

