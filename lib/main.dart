import 'package:flutter/material.dart';
import 'package:notes/src/home/views/home_view.dart';
import 'package:notes/src/home/views/pages/add_notes.dart';
import 'package:notes/src/home/views/pages/display_note.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeView.id,
      debugShowCheckedModeBanner: false,
      routes: {
        //   IntroView.id: (context) => const IntroView(),
        //   SignInView.id: (context) => const SignInView(),
        //   SignUpView.id: (context) => const SignUpView(),
        HomeView.id: (context) => const HomeView(),
        AddNotes.id: (context) => const AddNotes(),
        ShowNote.id: (context) => const ShowNote(),
      },
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'SfProDisplay',
            ),
        primaryTextTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'SfProDisplay',
            ),
      ),
      // home: const HomeView(),
    );
  }
}
