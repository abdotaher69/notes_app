import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled/veiws/notes_veiw.dart';
import 'package:untitled/veiws/widgets/notes_veiw_body.dart';

import 'bloc_observer.dart';
import 'constants.dart';
import 'cubits/add_note_cubit/add_note_cubit.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'models/note_model.dart';


void main() async {
  await Hive.initFlutter();
  Bloc.observer = NoteBlocObserver();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
        home: const NotesVeiw(),
      ),
    );
  }
}
