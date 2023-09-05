import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/cubits/notes/notsCubit.dart';
import 'package:notsapp/models/noteModel.dart';
import 'package:notsapp/views/EditNote.dart';

class nots_item extends StatelessWidget {
  const nots_item({Key? key, required this.note}) : super(key: key);
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNote(note: note,);
        },));
      },
      child: Container(
        padding: EdgeInsets.only(top:20,left: 16 ,bottom: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(note.color),
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,style: TextStyle(color: Colors.black,fontSize: 28),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(note.subTitle,style: TextStyle
                  (color: Colors.black.withOpacity(0.5),fontSize: 20),),
              ),
              trailing:IconButton(onPressed: (){
                note.delete();

                BlocProvider.of<NoteCubit>(context).fitshAllNotes();
              },icon:
              Icon(Icons.delete_rounded,size: 30,color: Colors.black,)),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(note.date.toString().substring(0,10),style:TextStyle
                (color: Colors.black.withOpacity(0.5),fontSize: 20),),
            )

          ],
        ),
      ),
    );
  }
}
