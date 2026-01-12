// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskModel {

 String get id; String get content;@JsonKey(name: 'duration') int? get duration;@JsonKey(name: 'comment_count') int get commentCount;@JsonKey(name: 'deadline') TaskDeadlineDto? get deadline;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskModelCopyWith<TaskModel> get copyWith => _$TaskModelCopyWithImpl<TaskModel>(this as TaskModel, _$identity);

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,duration,commentCount,deadline,createdAt);

@override
String toString() {
  return 'TaskModel(id: $id, content: $content, duration: $duration, commentCount: $commentCount, deadline: $deadline, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TaskModelCopyWith<$Res>  {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) _then) = _$TaskModelCopyWithImpl;
@useResult
$Res call({
 String id, String content,@JsonKey(name: 'duration') int? duration,@JsonKey(name: 'comment_count') int commentCount,@JsonKey(name: 'deadline') TaskDeadlineDto? deadline,@JsonKey(name: 'created_at') String createdAt
});


$TaskDeadlineDtoCopyWith<$Res>? get deadline;

}
/// @nodoc
class _$TaskModelCopyWithImpl<$Res>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._self, this._then);

  final TaskModel _self;
  final $Res Function(TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? duration = freezed,Object? commentCount = null,Object? deadline = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as TaskDeadlineDto?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskDeadlineDtoCopyWith<$Res>? get deadline {
    if (_self.deadline == null) {
    return null;
  }

  return $TaskDeadlineDtoCopyWith<$Res>(_self.deadline!, (value) {
    return _then(_self.copyWith(deadline: value));
  });
}
}


/// Adds pattern-matching-related methods to [TaskModel].
extension TaskModelPatterns on TaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String content, @JsonKey(name: 'duration')  int? duration, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'deadline')  TaskDeadlineDto? deadline, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.content,_that.duration,_that.commentCount,_that.deadline,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String content, @JsonKey(name: 'duration')  int? duration, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'deadline')  TaskDeadlineDto? deadline, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _TaskModel():
return $default(_that.id,_that.content,_that.duration,_that.commentCount,_that.deadline,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String content, @JsonKey(name: 'duration')  int? duration, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'deadline')  TaskDeadlineDto? deadline, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.content,_that.duration,_that.commentCount,_that.deadline,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskModel implements TaskModel {
  const _TaskModel({required this.id, required this.content, @JsonKey(name: 'duration') this.duration = 0, @JsonKey(name: 'comment_count') required this.commentCount, @JsonKey(name: 'deadline') required this.deadline, @JsonKey(name: 'created_at') required this.createdAt});
  factory _TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

@override final  String id;
@override final  String content;
@override@JsonKey(name: 'duration') final  int? duration;
@override@JsonKey(name: 'comment_count') final  int commentCount;
@override@JsonKey(name: 'deadline') final  TaskDeadlineDto? deadline;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskModelCopyWith<_TaskModel> get copyWith => __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,duration,commentCount,deadline,createdAt);

@override
String toString() {
  return 'TaskModel(id: $id, content: $content, duration: $duration, commentCount: $commentCount, deadline: $deadline, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(_TaskModel value, $Res Function(_TaskModel) _then) = __$TaskModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String content,@JsonKey(name: 'duration') int? duration,@JsonKey(name: 'comment_count') int commentCount,@JsonKey(name: 'deadline') TaskDeadlineDto? deadline,@JsonKey(name: 'created_at') String createdAt
});


@override $TaskDeadlineDtoCopyWith<$Res>? get deadline;

}
/// @nodoc
class __$TaskModelCopyWithImpl<$Res>
    implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(this._self, this._then);

  final _TaskModel _self;
  final $Res Function(_TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? duration = freezed,Object? commentCount = null,Object? deadline = freezed,Object? createdAt = null,}) {
  return _then(_TaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as TaskDeadlineDto?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskDeadlineDtoCopyWith<$Res>? get deadline {
    if (_self.deadline == null) {
    return null;
  }

  return $TaskDeadlineDtoCopyWith<$Res>(_self.deadline!, (value) {
    return _then(_self.copyWith(deadline: value));
  });
}
}


/// @nodoc
mixin _$TaskDeadlineDto {

 String? get date;
/// Create a copy of TaskDeadlineDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDeadlineDtoCopyWith<TaskDeadlineDto> get copyWith => _$TaskDeadlineDtoCopyWithImpl<TaskDeadlineDto>(this as TaskDeadlineDto, _$identity);

  /// Serializes this TaskDeadlineDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDeadlineDto&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'TaskDeadlineDto(date: $date)';
}


}

/// @nodoc
abstract mixin class $TaskDeadlineDtoCopyWith<$Res>  {
  factory $TaskDeadlineDtoCopyWith(TaskDeadlineDto value, $Res Function(TaskDeadlineDto) _then) = _$TaskDeadlineDtoCopyWithImpl;
@useResult
$Res call({
 String? date
});




}
/// @nodoc
class _$TaskDeadlineDtoCopyWithImpl<$Res>
    implements $TaskDeadlineDtoCopyWith<$Res> {
  _$TaskDeadlineDtoCopyWithImpl(this._self, this._then);

  final TaskDeadlineDto _self;
  final $Res Function(TaskDeadlineDto) _then;

/// Create a copy of TaskDeadlineDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskDeadlineDto].
extension TaskDeadlineDtoPatterns on TaskDeadlineDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskDeadlineDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskDeadlineDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskDeadlineDto value)  $default,){
final _that = this;
switch (_that) {
case _TaskDeadlineDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskDeadlineDto value)?  $default,){
final _that = this;
switch (_that) {
case _TaskDeadlineDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskDeadlineDto() when $default != null:
return $default(_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? date)  $default,) {final _that = this;
switch (_that) {
case _TaskDeadlineDto():
return $default(_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? date)?  $default,) {final _that = this;
switch (_that) {
case _TaskDeadlineDto() when $default != null:
return $default(_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskDeadlineDto implements TaskDeadlineDto {
  const _TaskDeadlineDto({this.date});
  factory _TaskDeadlineDto.fromJson(Map<String, dynamic> json) => _$TaskDeadlineDtoFromJson(json);

@override final  String? date;

/// Create a copy of TaskDeadlineDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDeadlineDtoCopyWith<_TaskDeadlineDto> get copyWith => __$TaskDeadlineDtoCopyWithImpl<_TaskDeadlineDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskDeadlineDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDeadlineDto&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'TaskDeadlineDto(date: $date)';
}


}

/// @nodoc
abstract mixin class _$TaskDeadlineDtoCopyWith<$Res> implements $TaskDeadlineDtoCopyWith<$Res> {
  factory _$TaskDeadlineDtoCopyWith(_TaskDeadlineDto value, $Res Function(_TaskDeadlineDto) _then) = __$TaskDeadlineDtoCopyWithImpl;
@override @useResult
$Res call({
 String? date
});




}
/// @nodoc
class __$TaskDeadlineDtoCopyWithImpl<$Res>
    implements _$TaskDeadlineDtoCopyWith<$Res> {
  __$TaskDeadlineDtoCopyWithImpl(this._self, this._then);

  final _TaskDeadlineDto _self;
  final $Res Function(_TaskDeadlineDto) _then;

/// Create a copy of TaskDeadlineDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,}) {
  return _then(_TaskDeadlineDto(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
