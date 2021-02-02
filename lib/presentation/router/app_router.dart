import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:server_notes/logic/cubit/note/note_cubit.dart';
import 'package:server_notes/logic/cubit/notes/notes_cubit.dart';
import 'package:server_notes/logic/firebase/firebase_note_repository.dart';

import 'package:server_notes/presentation/screens/note_screen.dart';
import 'package:server_notes/presentation/screens/notes_screen.dart';
import 'package:server_notes/presentation/screens/unknown_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<NotesCubit>(
            create: (_) => NotesCubit(
              noteRepository: FirebaseNoteRepository(),
            ),
            child: NotesScreen(),
          ),
        );
        break;
      case '/note':
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<NoteCubit>(
            create: (_) => NoteCubit(
              noteRepository: FirebaseNoteRepository(),
              note: settings.arguments,
            ),
            child: NoteScreen(),
          ),
        );
        break;
      default:
        return CupertinoPageRoute(
          builder: (_) => UnknownScreen(
            settings,
          ),
        );
    }
  }
}
