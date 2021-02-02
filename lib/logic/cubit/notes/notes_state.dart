part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesData extends NotesState {
  NotesData(this.notes);

  final List<Note> notes;
}

class NotesError extends NotesState {}
