part of 'note_bloc.dart';

@freezed
class NoteEvent with _$NoteEvent {
  const factory NoteEvent.loadNotes() = _LoadNotes;
  const factory NoteEvent.deleteNote(Note note) = _DeleteNote;
}