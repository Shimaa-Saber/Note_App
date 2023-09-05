import 'package:flutter/cupertino.dart';
import 'package:notsapp/models/noteModel.dart';

import '../../constants.dart';
import 'colorListView.dart';

class editNoteColorList extends StatefulWidget {
  const editNoteColorList({Key? key, required this.note}) : super(key: key);
final NoteModel note;
  @override
  State<editNoteColorList> createState() => _editNoteColorListState();
}

class _editNoteColorListState extends State<editNoteColorList> {
  late int currentIndex;


  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
