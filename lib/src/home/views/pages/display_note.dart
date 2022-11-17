import 'package:flutter/material.dart';
import 'package:notes/src/db/database_provider.dart';
import 'package:notes/src/home/views/home_view.dart';
import 'package:notes/src/model/notes_model.dart';

class ShowNote extends StatefulWidget {
  const ShowNote({super.key});

  static const String id = 'show_note';

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Note"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              size: 32,
            ),
            onPressed: () {
              DatabaseProvider.db.deleteNote(note.id!);
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeView.id, (route) => false);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              note.body,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
