import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/constants.dart';
import 'package:notsapp/cubits/AddNoteCubit/addNoteCubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color}) : super(key: key);
final bool isActive;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive?   CircleAvatar(
      backgroundColor: Colors.white,
      radius: 38,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    ) : CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}

class ColorList extends StatefulWidget {
  const ColorList({Key? key}) : super(key: key);

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int  CurrentIndex=0;
  List<Color> colors= kColors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: (){
              CurrentIndex=index;
              BlocProvider.of<AddNoteCubit>(context).color=kColors[index];
              setState(() {

              });
            },
            child: ColorItem(
              isActive: CurrentIndex==index,

              color: kColors[index],
            ),
          ),
        );
      },
        itemCount:kColors.length ,
        scrollDirection: Axis.horizontal,

      ),
    );
  }
}
