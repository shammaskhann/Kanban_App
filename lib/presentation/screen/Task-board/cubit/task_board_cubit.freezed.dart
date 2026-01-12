// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_board_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskBoardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskBoardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskBoardState()';
}


}

/// @nodoc
class $TaskBoardStateCopyWith<$Res>  {
$TaskBoardStateCopyWith(TaskBoardState _, $Res Function(TaskBoardState) __);
}


/// Adds pattern-matching-related methods to [TaskBoardState].
extension TaskBoardStatePatterns on TaskBoardState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _ChangeIndex value)?  changeIndex,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,TResult Function( _OperationSuccess value)?  operationSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ChangeIndex() when changeIndex != null:
return changeIndex(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _ChangeIndex value)  changeIndex,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,required TResult Function( _OperationSuccess value)  operationSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _ChangeIndex():
return changeIndex(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _OperationSuccess():
return operationSuccess(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _ChangeIndex value)?  changeIndex,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,TResult? Function( _OperationSuccess value)?  operationSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ChangeIndex() when changeIndex != null:
return changeIndex(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int index)?  changeIndex,TResult Function()?  loading,TResult Function( List<TaskEntity> toDo,  List<TaskEntity> inProgress,  List<TaskEntity> done)?  loaded,TResult Function( String message)?  error,TResult Function( String message)?  operationSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ChangeIndex() when changeIndex != null:
return changeIndex(_that.index);case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.toDo,_that.inProgress,_that.done);case _Error() when error != null:
return error(_that.message);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int index)  changeIndex,required TResult Function()  loading,required TResult Function( List<TaskEntity> toDo,  List<TaskEntity> inProgress,  List<TaskEntity> done)  loaded,required TResult Function( String message)  error,required TResult Function( String message)  operationSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _ChangeIndex():
return changeIndex(_that.index);case _Loading():
return loading();case _Loaded():
return loaded(_that.toDo,_that.inProgress,_that.done);case _Error():
return error(_that.message);case _OperationSuccess():
return operationSuccess(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int index)?  changeIndex,TResult? Function()?  loading,TResult? Function( List<TaskEntity> toDo,  List<TaskEntity> inProgress,  List<TaskEntity> done)?  loaded,TResult? Function( String message)?  error,TResult? Function( String message)?  operationSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ChangeIndex() when changeIndex != null:
return changeIndex(_that.index);case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.toDo,_that.inProgress,_that.done);case _Error() when error != null:
return error(_that.message);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TaskBoardState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskBoardState.initial()';
}


}




/// @nodoc


class _ChangeIndex implements TaskBoardState {
  const _ChangeIndex(this.index);
  

 final  int index;

/// Create a copy of TaskBoardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeIndexCopyWith<_ChangeIndex> get copyWith => __$ChangeIndexCopyWithImpl<_ChangeIndex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeIndex&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'TaskBoardState.changeIndex(index: $index)';
}


}

/// @nodoc
abstract mixin class _$ChangeIndexCopyWith<$Res> implements $TaskBoardStateCopyWith<$Res> {
  factory _$ChangeIndexCopyWith(_ChangeIndex value, $Res Function(_ChangeIndex) _then) = __$ChangeIndexCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$ChangeIndexCopyWithImpl<$Res>
    implements _$ChangeIndexCopyWith<$Res> {
  __$ChangeIndexCopyWithImpl(this._self, this._then);

  final _ChangeIndex _self;
  final $Res Function(_ChangeIndex) _then;

/// Create a copy of TaskBoardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_ChangeIndex(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Loading implements TaskBoardState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskBoardState.loading()';
}


}




/// @nodoc


class _Loaded implements TaskBoardState {
  const _Loaded({required final  List<TaskEntity> toDo, required final  List<TaskEntity> inProgress, required final  List<TaskEntity> done}): _toDo = toDo,_inProgress = inProgress,_done = done;
  

 final  List<TaskEntity> _toDo;
 List<TaskEntity> get toDo {
  if (_toDo is EqualUnmodifiableListView) return _toDo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_toDo);
}

 final  List<TaskEntity> _inProgress;
 List<TaskEntity> get inProgress {
  if (_inProgress is EqualUnmodifiableListView) return _inProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inProgress);
}

 final  List<TaskEntity> _done;
 List<TaskEntity> get done {
  if (_done is EqualUnmodifiableListView) return _done;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_done);
}


/// Create a copy of TaskBoardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._toDo, _toDo)&&const DeepCollectionEquality().equals(other._inProgress, _inProgress)&&const DeepCollectionEquality().equals(other._done, _done));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_toDo),const DeepCollectionEquality().hash(_inProgress),const DeepCollectionEquality().hash(_done));

@override
String toString() {
  return 'TaskBoardState.loaded(toDo: $toDo, inProgress: $inProgress, done: $done)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $TaskBoardStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<TaskEntity> toDo, List<TaskEntity> inProgress, List<TaskEntity> done
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of TaskBoardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? toDo = null,Object? inProgress = null,Object? done = null,}) {
  return _then(_Loaded(
toDo: null == toDo ? _self._toDo : toDo // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,inProgress: null == inProgress ? _self._inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,done: null == done ? _self._done : done // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,
  ));
}


}

/// @nodoc


class _Error implements TaskBoardState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of TaskBoardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskBoardState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $TaskBoardStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of TaskBoardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OperationSuccess implements TaskBoardState {
  const _OperationSuccess(this.message);
  

 final  String message;

/// Create a copy of TaskBoardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationSuccessCopyWith<_OperationSuccess> get copyWith => __$OperationSuccessCopyWithImpl<_OperationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskBoardState.operationSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class _$OperationSuccessCopyWith<$Res> implements $TaskBoardStateCopyWith<$Res> {
  factory _$OperationSuccessCopyWith(_OperationSuccess value, $Res Function(_OperationSuccess) _then) = __$OperationSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$OperationSuccessCopyWithImpl<$Res>
    implements _$OperationSuccessCopyWith<$Res> {
  __$OperationSuccessCopyWithImpl(this._self, this._then);

  final _OperationSuccess _self;
  final $Res Function(_OperationSuccess) _then;

/// Create a copy of TaskBoardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_OperationSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
