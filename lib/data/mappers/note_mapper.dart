import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:server_notes/data/models/note_model.dart';

class NoteMapper {
  static Note fromDoc(DocumentSnapshot doc) {
    final data = doc.data();

    return Note(
      id: doc.id,
      title: data['title'],
      data: data['data'],
    );
  }

  static Map<String, dynamic> toMap(Note note) {
    return {
      'title': note.title,
      'data': note.data,
    };
  }
}
