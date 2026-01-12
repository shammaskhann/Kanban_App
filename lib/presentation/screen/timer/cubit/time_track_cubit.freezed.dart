// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_track_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeTrackState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeTrackState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeTrackState()';
}


}

/// @nodoc
class $TimeTrackStateCopyWith<$Res>  {
$TimeTrackStateCopyWith(TimeTrackState _, $Res Function(TimeTrackState) __);
}


/// Adds pattern-matching-related methods to [TimeTrackState].
extension TimeTrackStatePatterns on TimeTrackState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _ChangeIndex value)?  changeIndex,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,TResult Function( _OperationSuccess value)?  operationSuccess,TResult Function( _UpdateDuration value)?  updateDurantion,TResult Function( _SelectTask value)?  selectTask,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ChangeIndex() when changeIndex != null:
return changeIndex(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that);case _UpdateDuration() when updateDurantion != null:
return updateDurantion(_that);case _SelectTask() when selectTask != null:
return selectTask(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _ChangeIndex value)  changeIndex,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,required TResult Function( _OperationSuccess value)  operationSuccess,required TResult Function( _UpdateDuration value)  updateDurantion,required TResult Function( _SelectTask value)  selectTask,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _ChangeIndex():
return changeIndex(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _OperationSuccess():
return operationSuccess(_that);case _UpdateDuration():
return updateDurantion(_that);case _SelectTask():
return selectTask(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _ChangeIndex value)?  changeIndex,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,TResult? Function( _OperationSuccess value)?  operationSuccess,TResult? Function( _UpdateDuration value)?  updateDurantion,TResult? Function( _SelectTask value)?  selectTask,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ChangeIndex() when changeIndex != null:
return changeIndex(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that);case _UpdateDuration() when updateDurantion != null:
return updateDurantion(_that);case _SelectTask() when selectTask != null:
return selectTask(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int index)?  changeIndex,TResult Function()?  loading,TResult Function( List<TaskEntity> toDo,  List<TaskEntity> inProgress)?  loaded,TResult Function( String message)?  error,TResult Function( String message)?  operationSuccess,TResult Function( int duration)?  updateDurantion,TResult Function( TaskEntity task)?  selectTask,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ChangeIndex() when changeIndex != null:
return changeIndex(_that.index);case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.toDo,_that.inProgress);case _Error() when error != null:
return error(_that.message);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that.message);case _UpdateDuration() when updateDurantion != null:
return updateDurantion(_that.duration);case _SelectTask() when selectTask != null:
return selectTask(_that.task);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int index)  changeIndex,required TResult Function()  loading,required TResult Function( List<TaskEntity> toDo,  List<TaskEntity> inProgress)  loaded,required TResult Function( String message)  error,required TResult Function( String message)  operationSuccess,required TResult Function( int duration)  updateDurantion,required TResult Function( TaskEntity task)  selectTask,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _ChangeIndex():
return changeIndex(_that.index);case _Loading():
return loading();case _Loaded():
return loaded(_that.toDo,_that.inProgress);case _Error():
return error(_that.message);case _OperationSuccess():
return operationSuccess(_that.message);case _UpdateDuration():
return updateDurantion(_that.duration);case _SelectTask():
return selectTask(_that.task);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int index)?  changeIndex,TResult? Function()?  loading,TResult? Function( List<TaskEntity> toDo,  List<TaskEntity> inProgress)?  loaded,TResult? Function( String message)?  error,TResult? Function( String message)?  operationSuccess,TResult? Function( int duration)?  updateDurantion,TResult? Function( TaskEntity task)?  selectTask,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ChangeIndex() when changeIndex != null:
return changeIndex(_that.index);case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.toDo,_that.inProgress);case _Error() when error != null:
return error(_that.message);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that.message);case _UpdateDuration() when updateDurantion != null:
return updateDurantion(_that.duration);case _SelectTask() when selectTask != null:
return selectTask(_that.task);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TimeTrackState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeTrackState.initial()';
}


}




/// @nodoc


class _ChangeIndex implements TimeTrackState {
  const _ChangeIndex(this.index);
  

 final  int index;

/// Create a copy of TimeTrackState
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
  return 'TimeTrackState.changeIndex(index: $index)';
}


}

/// @nodoc
abstract mixin class _$ChangeIndexCopyWith<$Res> implements $TimeTrackStateCopyWith<$Res> {
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

/// Create a copy of TimeTrackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_ChangeIndex(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Loading implements TimeTrackState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeTrackState.loading()';
}


}




/// @nodoc


class _Loaded implements TimeTrackState {
  const _Loaded({required final  List<TaskEntity> toDo, required final  List<TaskEntity> inProgress}): _toDo = toDo,_inProgress = inProgress;
  

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


/// Create a copy of TimeTrackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._toDo, _toDo)&&const DeepCollectionEquality().equals(other._inProgress, _inProgress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_toDo),const DeepCollectionEquality().hash(_inProgress));

@override
String toString() {
  return 'TimeTrackState.loaded(toDo: $toDo, inProgress: $inProgress)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $TimeTrackStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<TaskEntity> toDo, List<TaskEntity> inProgress
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of TimeTrackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? toDo = null,Object? inProgress = null,}) {
  return _then(_Loaded(
toDo: null == toDo ? _self._toDo : toDo // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,inProgress: null == inProgress ? _self._inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,
  ));
}


}

/// @nodoc


class _Error implements TimeTrackState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of TimeTrackState
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
  return 'TimeTrackState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $TimeTrackStateCopyWith<$Res> {
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

/// Create a copy of TimeTrackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OperationSuccess implements TimeTrackState {
  const _OperationSuccess(this.message);
  

 final  String message;

/// Create a copy of TimeTrackState
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
  return 'TimeTrackState.operationSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class _$OperationSuccessCopyWith<$Res> implements $TimeTrackStateCopyWith<$Res> {
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

/// Create a copy of TimeTrackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_OperationSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateDuration implements TimeTrackState {
  const _UpdateDuration(this.duration);
  

 final  int duration;

/// Create a copy of TimeTrackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDurationCopyWith<_UpdateDuration> get copyWith => __$UpdateDurationCopyWithImpl<_UpdateDuration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDuration&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'TimeTrackState.updateDurantion(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$UpdateDurationCopyWith<$Res> implements $TimeTrackStateCopyWith<$Res> {
  factory _$UpdateDurationCopyWith(_UpdateDuration value, $Res Function(_UpdateDuration) _then) = __$UpdateDurationCopyWithImpl;
@useResult
$Res call({
 int duration
});




}
/// @nodoc
class __$UpdateDurationCopyWithImpl<$Res>
    implements _$UpdateDurationCopyWith<$Res> {
  __$UpdateDurationCopyWithImpl(this._self, this._then);

  final _UpdateDuration _self;
  final $Res Function(_UpdateDuration) _then;

/// Create a copy of TimeTrackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_UpdateDuration(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SelectTask implements TimeTrackState {
  const _SelectTask(this.task);
  

 final  TaskEntity task;

/// Create a copy of TimeTrackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectTaskCopyWith<_SelectTask> get copyWith => __$SelectTaskCopyWithImpl<_SelectTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectTask&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TimeTrackState.selectTask(task: $task)';
}


}

/// @nodoc
abstract mixin class _$SelectTaskCopyWith<$Res> implements $TimeTrackStateCopyWith<$Res> {
  factory _$SelectTaskCopyWith(_SelectTask value, $Res Function(_SelectTask) _then) = __$SelectTaskCopyWithImpl;
@useResult
$Res call({
 TaskEntity task
});




}
/// @nodoc
class __$SelectTaskCopyWithImpl<$Res>
    implements _$SelectTaskCopyWith<$Res> {
  __$SelectTaskCopyWithImpl(this._self, this._then);

  final _SelectTask _self;
  final $Res Function(_SelectTask) _then;

/// Create a copy of TimeTrackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(_SelectTask(
null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity,
  ));
}


}

// dart format on
