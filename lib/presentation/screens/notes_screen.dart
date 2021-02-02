import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:server_notes/data/models/note_model.dart';

import 'package:server_notes/logic/cubit/notes/notes_cubit.dart';

import 'package:server_notes/presentation/widgets/note_card_widget.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _onTapAdd() {
      Navigator.of(context).pushNamed('/note');
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        middle: Text('Server Notes'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () => _onTapAdd(),
        ),
      ),
      child: SafeArea(
        child: BlocBuilder(
          cubit: BlocProvider.of<NotesCubit>(context),
          builder: (_, state) {
            if (state is NotesData) {
              return DataNotesScreen(state.notes);
            } else if (state is NotesError) {
              return ErrorNotesScreen();
            }

            return InitialNotesScreen();
          },
        ),
      ),
    );
  }
}

class InitialNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}

class DataNotesScreen extends StatelessWidget {
  DataNotesScreen(this.notes);

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    void _onDimissed(Note note) {
      BlocProvider.of<NotesCubit>(context).deleteNote(note);
    }

    if (notes.length == 0) {
      return Center(
        child: Text(
          'У вас нету заметок',
        ),
      );
    }

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) => NoteCard(
        notes[index],
        onTap: () {
          return Navigator.of(context)
              .pushNamed('/note', arguments: notes[index]);
        },
        onDismissed: (direction) => _onDimissed(notes[index]),
      ),
    );
  }
}

class ErrorNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Произошла ошибка, повторите позже',
      ),
    );
  }
}
