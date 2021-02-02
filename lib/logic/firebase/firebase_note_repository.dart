import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:server_notes/data/models/note_model.dart';
import 'package:server_notes/data/mappers/note_mapper.dart';
import 'package:server_notes/data/repositories/note_repository.dart';

class FirebaseNoteRepository extends NoteRepository {
  final notes = FirebaseFirestore.instance.collection('notes');

  @override
  Stream<List<Note>> streamNotes() {
    return notes.snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) => NoteMapper.fromDoc(doc)).toList();
      },
    );
  }

  @override
  Future createNote(Note note) async {
    return await notes.add(NoteMapper.toMap(note));
  }

  @override
  Future updateNote(Note note) async {
    return await notes.doc(note.id).update(NoteMapper.toMap(note));
  }

  @override
  Future deleteNote(Note note) async {
    return await notes.doc(note.id).delete();
  }
}
