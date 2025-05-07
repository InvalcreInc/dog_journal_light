// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_note_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddNoteEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNoteEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNoteEvent()';
}


}

/// @nodoc
class $AddNoteEventCopyWith<$Res>  {
$AddNoteEventCopyWith(AddNoteEvent _, $Res Function(AddNoteEvent) __);
}


/// @nodoc


class _Started implements AddNoteEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNoteEvent.started()';
}


}




/// @nodoc


class _AddNote implements AddNoteEvent {
  const _AddNote(this.note);
  

 final  Note note;

/// Create a copy of AddNoteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddNoteCopyWith<_AddNote> get copyWith => __$AddNoteCopyWithImpl<_AddNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddNote&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'AddNoteEvent.addNote(note: $note)';
}


}

/// @nodoc
abstract mixin class _$AddNoteCopyWith<$Res> implements $AddNoteEventCopyWith<$Res> {
  factory _$AddNoteCopyWith(_AddNote value, $Res Function(_AddNote) _then) = __$AddNoteCopyWithImpl;
@useResult
$Res call({
 Note note
});




}
/// @nodoc
class __$AddNoteCopyWithImpl<$Res>
    implements _$AddNoteCopyWith<$Res> {
  __$AddNoteCopyWithImpl(this._self, this._then);

  final _AddNote _self;
  final $Res Function(_AddNote) _then;

/// Create a copy of AddNoteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(_AddNote(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Note,
  ));
}


}

/// @nodoc
mixin _$AddNoteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNoteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNoteState()';
}


}

/// @nodoc
class $AddNoteStateCopyWith<$Res>  {
$AddNoteStateCopyWith(AddNoteState _, $Res Function(AddNoteState) __);
}


/// @nodoc


class _Initial implements AddNoteState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNoteState.initial()';
}


}




/// @nodoc


class _InProgress implements AddNoteState {
  const _InProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNoteState.inProgress()';
}


}




/// @nodoc


class _Success implements AddNoteState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNoteState.success()';
}


}




/// @nodoc


class _Failure implements AddNoteState {
  const _Failure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNoteState.failure()';
}


}




// dart format on
