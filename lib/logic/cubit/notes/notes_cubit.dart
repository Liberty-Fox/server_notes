import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:server_notes/data/models/note_model.dart';
import 'package:server_notes/data/repositories/note_repository.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit({@required this.noteRepository}) : super(NotesInitial()) {
    notesInit();
  }

  final NoteRepository noteRepository;

  notesInit() {
    noteRepository.streamNotes().listen((data) {
      emit(NotesData(data));
    }).onError((e) {
      emit(NotesError());
    });
  }

  deleteNote(Note note) async {
    await noteRepository.deleteNote(note);
  }
}
