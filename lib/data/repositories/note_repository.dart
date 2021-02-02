import 'package:server_notes/data/models/note_model.dart';

abstract class NoteRepository {
  Stream<List<Note>> streamNotes();

  Future createNote(Note note);
  Future updateNote(Note note);
  Future deleteNote(Note note);
}
