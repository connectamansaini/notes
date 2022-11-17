import 'package:flutter/material.dart';
import 'package:notes/src/home/views/widgets/custom_list_tile.dart';

class ListPage extends StatefulWidget {
  const ListPage({
    super.key,
    required this.getNotes,
  });
  final dynamic Function() getNotes;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Icon(
                      Icons.post_add,
                      size: 100,
                    ),
                    Text(
                      "Add Notes",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  // child: ReorderableListView.builder(
                  child: ListView.builder(
                    // header: const Padding(
                    //   padding: EdgeInsets.only(bottom: 20),
                    //   child: Text(
                    //     'Notes',
                    //   ),
                    // ),
                    // onReorder: (int oldIndex, int newIndex) {
                    //   setState(() {
                    //     if (oldIndex < newIndex) {
                    //       newIndex -= 1;
                    //     }
                    //     final int item = _items.removeAt(oldIndex);
                    //     _items.insert(newIndex, item);
                    //   });
                    // },
                    itemCount: noteData.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      int id = noteData.data[index]['id'];
                      String title = noteData.data[index]['title'];
                      String body = noteData.data[index]['body'];
                      String creationDate =
                          noteData.data[index]['creation_date'];
                      

                      return CustomListTile(
                          title: title,
                          body: body,
                          creationDate: creationDate,
                          id: id);
                    },
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
