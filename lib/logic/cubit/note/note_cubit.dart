import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:server_notes/data/models/note_model.dart';
import 'package:server_notes/data/repositories/note_repository.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit({
    @required this.noteRepository,
    this.note,
  }) : super(NoteState()) {
    noteInit();
  }

  final NoteRepository noteRepository;
  final Note note;

  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController dataTextEditingController = TextEditingController();

  void noteInit() {
    titleTextEditingController.text = note != null ? note.title : '';
    dataTextEditingController.text = note != null ? note.data : '';
  }

  Future changeNote(context) async {
    final _title = titleTextEditingController.text;
    final _data = dataTextEditingController.text;

    if (_title.isEmpty) {
      emit(NoteState(error: true));
    } else {
      if (note == null) {
        await noteRepository.createNote(Note(
          title: _title,
          data: _data,
        ));
      } else {
        await noteRepository.updateNote(Note(
          id: note.id,
          title: _title,
          data: _data,
        ));
      }

      Navigator.of(context).pop();
    }
  }
}
