import 'package:flutter/material.dart';
import 'package:notes/src/home/views/pages/display_note.dart';
import 'package:notes/src/model/notes_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.body,
    required this.creationDate,
    required this.id,
  }) : super(key: key);

  final String title;
  final String body;
  final String creationDate;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      child: ListTile(
        // key: Key('$index'),
        leading: const Icon(
          Icons.article,
          size: 50,
        ),
        trailing: const Icon(Icons.more_horiz),
        onTap: () {
          Navigator.pushNamed(
            context,
            ShowNote.id,
            arguments: NoteModel(
              title: title,
              body: body,
              creationDate: creationDate,
              id: id,
            ),
          );
        },
        title: Text(title),
        subtitle: Text(
          creationDate,
          style: const TextStyle(
            color: Colors.white30,
          ),
        ),
        tileColor: Colors.white10,
        // ),
      ),
    );
  }
}
