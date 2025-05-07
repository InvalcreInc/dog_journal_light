import 'package:dog_journal_light/application/log/logger.dart';
import 'package:dog_journal_light/domain/note/note.dart';
import 'package:dog_journal_light/repo/note/note_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_event.dart';
part 'note_state.dart';
part 'note_bloc.freezed.dart';

extension NoteStateX on NoteState {
  bool get isLoading => this is _LoadInProgress;
  bool get isSuccess => this is _LoadSuccess;
  bool get isEmpty => notes.isEmpty;
  List<Note> get notes => switch (this) {
    _LoadSuccess notes => notes.notes,
    _ => [],
  };
}

final class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final LocalStorageApi _noteRepo;
  NoteBloc(this._noteRepo) : super(NoteState.initial()) {
    on<NoteEvent>((event, emit) async {
      if (event is _LoadNotes) {
        await _streamNotes(emit);
      }
      if (event is _DeleteNote) {
        await _deleteNote(event.note, emit);
      }
    });
  }

  _streamNotes(Emitter<NoteState> emit) async {
    try {
      emit(NoteState.loadInProgress());
      await for (final notes in _noteRepo.getNotesStream()) {
        emit(NoteState.loadSuccess(List<Note>.from(notes)));
      }
    } catch (e, s) {
      AppLogger().error(e, s);
      emit(NoteState.loadFailure());
    }
  }

  //_refetchNotes(Emitter<NoteState> emit) async {
  //  try {
  //    final notes = await _noteRepo.getNotes();
  //    emit(NoteState.loadSuccess(notes));
  //  } catch (e, s) {
  //    AppLogger().error(e, s);
  //  }
  //}

  _deleteNote(Note note, Emitter<NoteState> emit) async {
    try {
      await _noteRepo.deleteNote(note);
      //await _refetchNotes(emit);
    } catch (e, s) {
      AppLogger().error(e, s);
      return;
    }
  }
}
