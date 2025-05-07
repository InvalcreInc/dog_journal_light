import 'dart:async';
import 'dart:convert';

import 'package:dog_journal_light/application/log/logger.dart';
import 'package:dog_journal_light/domain/note/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LocalStorageApi {
  static const String _key = '__notes__';
  final SharedPreferences _prefs;
  bool _loadingNotes;
  final StreamController<List<Note>> _notesStreamController;
  List<Note> _notes = [];

  LocalStorageApi(this._prefs)
    : _loadingNotes = false,
      _notesStreamController = StreamController<List<Note>>(sync: true) {
    _init();
  }

  Stream<List<Note>> getNotesStream() => _notesStreamController.stream;

  Future<List<Note>> getNotes() async {
    while (_loadingNotes) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    await _init();
    return _notes;
  }

  Future<void> _init() async {
    _loadingNotes = true;
    final notesJson = _prefs.getString(_key);
    if (notesJson != null) {
      try {
        final List<dynamic> notesList = json.decode(notesJson);
        _notes = notesList.map((noteMap) => Note.fromMap(noteMap)).toList();
      } catch (e) {
        _notes = [];
      }
    }
    AppLogger().debug("_notes: $_notes");
    _loadingNotes = false;
    _notesStreamController.add(_notes);
  }

  Future<bool> addNote(Note note) async {
    final index = _notes.indexWhere((element) => element.id == note.id);
    if (index != -1) {
      _notes[index] = note;
    } else {
      _notes.add(note);
    }
    await _saveNotes();
    _notesStreamController.add(_notes);
    return true;
  }

  Future<void> deleteNote(Note note) async {
    _notes.removeWhere((element) => element.id == note.id);
    await _saveNotes();
    _notesStreamController.add(_notes);
  }

  Future<void> _saveNotes() async {
    await _setValue(_key, json.encode(_notes.map((n) => n.toMap()).toList()));
  }

  Future<void> _setValue(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<void> dispose() async {
    await _notesStreamController.close();
  }
}
