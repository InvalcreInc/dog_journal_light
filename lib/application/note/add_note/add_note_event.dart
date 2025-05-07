part of 'add_note_bloc.dart';

@freezed
class AddNoteEvent with _$AddNoteEvent {
  const factory AddNoteEvent.started() = _Started;
  const factory AddNoteEvent.addNote(Note note) = _AddNote;
  
}