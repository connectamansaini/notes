import 'package:flutter/material.dart';
import 'package:notes/src/home/views/pages/display_note.dart';
import 'package:notes/src/model/notes_model.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key, required this.getNotes});
  final dynamic Function() getNotes;
  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  // final data = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.getNotes(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> noteData) {
        switch (noteData.connectionState) {
          case ConnectionState.waiting:
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

          case ConnectionState.done:
            {
              if (noteData.data == Null) {
                return const Center(
                  child: Text("You don't have any notes yet, create one"),
                );
              } else {
                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: noteData.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    String title = noteData.data[index]['title'];
                    String body = noteData.data[index]['body'];
                    String creationDate = noteData.data[index]['creation_date'];
                    int id = noteData.data[index]['id'];

                    return GestureDetector(
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
                      child: Container(
                        color: Colors.white12,
                        child: GridTile(
                          header: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(
                                  Icons.pin_drop,
                                  size: 16,
                                ),
                                Icon(Icons.more_horiz),
                              ],
                            ),
                          ),
                          footer: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(title.trim()),
                          )),
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Icon(
                              Icons.book,
                              size: 64,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                  ),
                );
              }
            }
          case ConnectionState.none:
            const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
            const Center(
              child: CircularProgressIndicator(),
            );
            break;
        }
        return const CircularProgressIndicator();
        // child: body[_currentLayout],
      },
    );
  }
}





      // child: GridView.builder(
      //   itemBuilder: (BuildContext context, int index) {},
        // crossAxisSpacing: 10,
        // mainAxisSpacing: 10,
        // crossAxisCount: 3,
        // onReorder: (oldIndex, newIndex) {
        //   setState(() {
        //     final element = data.removeAt(oldIndex);
        //     data.insert(newIndex, element);
        //   });
        // },
        // footer: const [
        //   Card(
        //     child: Center(
        //       child: Icon(Icons.add),
        //     ),
        //   ),
        // ],
        // children:
        //     data.map((e) => buildItem(e, "Title", "Subtitle")).toList(),
      // ),

// Card(
//         key: ValueKey(index),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Icon(
//                   Icons.pin_drop,
//                   size: 16,
//                 ),
//                 Icon(Icons.more_horiz),
//               ],
//             ),
//             const Icon(
//               Icons.book,
//               size: 16,
//             ),
//             Text(title),
//             Text(subtitle),
//           ],
//         ),
//       );