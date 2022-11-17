import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/src/db/database_provider.dart';
import 'package:notes/src/home/views/home_view.dart';
import 'package:notes/src/model/notes_model.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  static const String id = 'add_notes';

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  late String title;
  late String body;
  late String creationDate;

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  addNotes(NoteModel note) {
    DatabaseProvider.db.addNewNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  title = titleController.text;
                  body = bodyController.text;
                  var now = DateTime.now();
                  creationDate =
                      DateFormat('d MMM,y kk:mm aaa').format(now);
                });
                NoteModel note = NoteModel(
                    title: title,
                    body: body,
                    creationDate: creationDate.toString());
                addNotes(note);
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeView.id, (route) => false);
              },
              child: const Text(
                'Done',
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TextField(
                controller: bodyController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type Here',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
