part of 'add_note_bloc.dart';

@freezed
class AddNoteState with _$AddNoteState {
  const factory AddNoteState.initial() = _Initial;
  const factory AddNoteState.inProgress() = _InProgress;
  const factory AddNoteState.success() = _Success;
  const factory AddNoteState.failure() = _Failure;
}
