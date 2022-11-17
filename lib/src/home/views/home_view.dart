import 'package:flutter/material.dart';
import 'package:notes/src/db/database_provider.dart';
import 'package:notes/src/home/views/pages/add_notes.dart';
import 'package:notes/src/home/views/pages/grid_page.dart';
import 'package:notes/src/home/views/pages/list_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String id = 'home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // late int _currentIndex = 0;
  int _currentLayout = 0;

  List<Widget> body = [
    ListPage(
      getNotes: () async {
        return await DatabaseProvider.db.getNotes();
      },
    ),
    GridPage(
      getNotes: () async {
        return await DatabaseProvider.db.getNotes();
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          const Icon(
            Icons.search,
            size: 32,
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            icon: const Icon(
              Icons.sort,
              size: 32,
            ),
            onPressed: () {
              if (_currentLayout == 0) {
                setState(() {
                  _currentLayout = 1;
                });
              } else if (_currentLayout == 1) {
                setState(() {
                  _currentLayout = 0;
                });
              }
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: body[_currentLayout],
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   selectedItemColor: Colors.white,
      //   // fixedColor: Colors.white,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: 'Pins'),
      //     BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Labels'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_box), label: 'My Account'),
      //   ],
      //   currentIndex: _currentIndex,
      //   onTap: (int newIndex) {
      //     setState(() {
      //       _currentIndex = newIndex;
      //     });
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNotes.id);
        },
        tooltip: 'Edit',
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
