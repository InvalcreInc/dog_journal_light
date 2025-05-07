import 'package:bloc/bloc.dart';
import 'package:dog_journal_light/application/log/logger.dart';
import 'package:dog_journal_light/domain/note/note.dart';
import 'package:dog_journal_light/repo/note/note_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_note_event.dart';
part 'add_note_state.dart';
part 'add_note_bloc.freezed.dart';

extension AddNoteStateX on AddNoteState {
  bool get isLoading => this is _InProgress;
  bool get isSuccess => this is _Success;
  bool get isFailure => this is _Failure;
  bool get isInitial => this is _Initial;
}

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  final LocalStorageApi _repo;
  AddNoteBloc(this._repo) : super(AddNoteState.initial()) {
    on<AddNoteEvent>((event, emit) async {
      if (event is _Initial) {
        emit(AddNoteState.initial());
      }
      if (event is _AddNote) {
        await _addNote(event.note, emit);
      }
    });
  }

  _addNote(Note note, Emitter<AddNoteState> emit) async {
    try {
      emit(AddNoteState.inProgress());
      final saved = await _repo.addNote(note);
      assert(saved, 'Failed to save note');
      emit(AddNoteState.success());
    } catch (e, s) {
      AppLogger().error(e, s);
      emit(AddNoteState.failure());
      return;
    }
  }
}
