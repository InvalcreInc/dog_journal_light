// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEvent()';
}


}

/// @nodoc
class $NoteEventCopyWith<$Res>  {
$NoteEventCopyWith(NoteEvent _, $Res Function(NoteEvent) __);
}


/// @nodoc


class _LoadNotes implements NoteEvent {
  const _LoadNotes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadNotes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEvent.loadNotes()';
}


}




/// @nodoc


class _DeleteNote implements NoteEvent {
  const _DeleteNote(this.note);
  

 final  Note note;

/// Create a copy of NoteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteNoteCopyWith<_DeleteNote> get copyWith => __$DeleteNoteCopyWithImpl<_DeleteNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteNote&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'NoteEvent.deleteNote(note: $note)';
}


}

/// @nodoc
abstract mixin class _$DeleteNoteCopyWith<$Res> implements $NoteEventCopyWith<$Res> {
  factory _$DeleteNoteCopyWith(_DeleteNote value, $Res Function(_DeleteNote) _then) = __$DeleteNoteCopyWithImpl;
@useResult
$Res call({
 Note note
});




}
/// @nodoc
class __$DeleteNoteCopyWithImpl<$Res>
    implements _$DeleteNoteCopyWith<$Res> {
  __$DeleteNoteCopyWithImpl(this._self, this._then);

  final _DeleteNote _self;
  final $Res Function(_DeleteNote) _then;

/// Create a copy of NoteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(_DeleteNote(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Note,
  ));
}


}

/// @nodoc
mixin _$NoteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteState()';
}


}

/// @nodoc
class $NoteStateCopyWith<$Res>  {
$NoteStateCopyWith(NoteState _, $Res Function(NoteState) __);
}


/// @nodoc


class _Initial implements NoteState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteState.initial()';
}


}




/// @nodoc


class _LoadInProgress implements NoteState {
  const _LoadInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteState.loadInProgress()';
}


}




/// @nodoc


class _LoadSuccess implements NoteState {
  const _LoadSuccess(final  List<Note> notes): _notes = notes;
  

 final  List<Note> _notes;
 List<Note> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}


/// Create a copy of NoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadSuccessCopyWith<_LoadSuccess> get copyWith => __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadSuccess&&const DeepCollectionEquality().equals(other._notes, _notes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notes));

@override
String toString() {
  return 'NoteState.loadSuccess(notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$LoadSuccessCopyWith<$Res> implements $NoteStateCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(_LoadSuccess value, $Res Function(_LoadSuccess) _then) = __$LoadSuccessCopyWithImpl;
@useResult
$Res call({
 List<Note> notes
});




}
/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(this._self, this._then);

  final _LoadSuccess _self;
  final $Res Function(_LoadSuccess) _then;

/// Create a copy of NoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notes = null,}) {
  return _then(_LoadSuccess(
null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<Note>,
  ));
}


}

/// @nodoc


class _LoadFailure implements NoteState {
  const _LoadFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteState.loadFailure()';
}


}




// dart format on
