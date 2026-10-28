// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterEvent {

 String get name; int get page;
/// Create a copy of CharacterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterEventCopyWith<CharacterEvent> get copyWith => _$CharacterEventCopyWithImpl<CharacterEvent>(this as CharacterEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterEvent&&(identical(other.name, name) || other.name == name)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,name,page);

@override
String toString() {
  return 'CharacterEvent(name: $name, page: $page)';
}


}

/// @nodoc
abstract mixin class $CharacterEventCopyWith<$Res>  {
  factory $CharacterEventCopyWith(CharacterEvent value, $Res Function(CharacterEvent) _then) = _$CharacterEventCopyWithImpl;
@useResult
$Res call({
 String name, int page
});




}
/// @nodoc
class _$CharacterEventCopyWithImpl<$Res>
    implements $CharacterEventCopyWith<$Res> {
  _$CharacterEventCopyWithImpl(this._self, this._then);

  final CharacterEvent _self;
  final $Res Function(CharacterEvent) _then;

/// Create a copy of CharacterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? page = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterEvent].
extension CharacterEventPatterns on CharacterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CharacterEventFetch value)?  fetch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CharacterEventFetch() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CharacterEventFetch value)  fetch,}){
final _that = this;
switch (_that) {
case CharacterEventFetch():
return fetch(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CharacterEventFetch value)?  fetch,}){
final _that = this;
switch (_that) {
case CharacterEventFetch() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  int page)?  fetch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CharacterEventFetch() when fetch != null:
return fetch(_that.name,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  int page)  fetch,}) {final _that = this;
switch (_that) {
case CharacterEventFetch():
return fetch(_that.name,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  int page)?  fetch,}) {final _that = this;
switch (_that) {
case CharacterEventFetch() when fetch != null:
return fetch(_that.name,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class CharacterEventFetch implements CharacterEvent {
  const CharacterEventFetch({required this.name, required this.page});
  

@override final  String name;
@override final  int page;

/// Create a copy of CharacterEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterEventFetchCopyWith<CharacterEventFetch> get copyWith => _$CharacterEventFetchCopyWithImpl<CharacterEventFetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterEventFetch&&(identical(other.name, name) || other.name == name)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,name,page);

@override
String toString() {
  return 'CharacterEvent.fetch(name: $name, page: $page)';
}


}

/// @nodoc
abstract mixin class $CharacterEventFetchCopyWith<$Res> implements $CharacterEventCopyWith<$Res> {
  factory $CharacterEventFetchCopyWith(CharacterEventFetch value, $Res Function(CharacterEventFetch) _then) = _$CharacterEventFetchCopyWithImpl;
@override @useResult
$Res call({
 String name, int page
});




}
/// @nodoc
class _$CharacterEventFetchCopyWithImpl<$Res>
    implements $CharacterEventFetchCopyWith<$Res> {
  _$CharacterEventFetchCopyWithImpl(this._self, this._then);

  final CharacterEventFetch _self;
  final $Res Function(CharacterEventFetch) _then;

/// Create a copy of CharacterEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? page = null,}) {
  return _then(CharacterEventFetch(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

CharacterState _$CharacterStateFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'loading':
          return CharacterStateLoading.fromJson(
            json
          );
                case 'loaded':
          return CharacterStateLoaded.fromJson(
            json
          );
                case 'error':
          return CharacterStateError.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CharacterState',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CharacterState {



  /// Serializes this CharacterState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterState);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharacterState()';
}


}

/// @nodoc
class $CharacterStateCopyWith<$Res>  {
$CharacterStateCopyWith(CharacterState _, $Res Function(CharacterState) __);
}


/// Adds pattern-matching-related methods to [CharacterState].
extension CharacterStatePatterns on CharacterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CharacterStateLoading value)?  loading,TResult Function( CharacterStateLoaded value)?  loaded,TResult Function( CharacterStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CharacterStateLoading() when loading != null:
return loading(_that);case CharacterStateLoaded() when loaded != null:
return loaded(_that);case CharacterStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CharacterStateLoading value)  loading,required TResult Function( CharacterStateLoaded value)  loaded,required TResult Function( CharacterStateError value)  error,}){
final _that = this;
switch (_that) {
case CharacterStateLoading():
return loading(_that);case CharacterStateLoaded():
return loaded(_that);case CharacterStateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CharacterStateLoading value)?  loading,TResult? Function( CharacterStateLoaded value)?  loaded,TResult? Function( CharacterStateError value)?  error,}){
final _that = this;
switch (_that) {
case CharacterStateLoading() when loading != null:
return loading(_that);case CharacterStateLoaded() when loaded != null:
return loaded(_that);case CharacterStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Character characterLoaded)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CharacterStateLoading() when loading != null:
return loading();case CharacterStateLoaded() when loaded != null:
return loaded(_that.characterLoaded);case CharacterStateError() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Character characterLoaded)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case CharacterStateLoading():
return loading();case CharacterStateLoaded():
return loaded(_that.characterLoaded);case CharacterStateError():
return error();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Character characterLoaded)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case CharacterStateLoading() when loading != null:
return loading();case CharacterStateLoaded() when loaded != null:
return loaded(_that.characterLoaded);case CharacterStateError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CharacterStateLoading implements CharacterState {
  const CharacterStateLoading({final  String? $type}): $type = $type ?? 'loading';
  factory CharacterStateLoading.fromJson(Map<String, dynamic> json) => _$CharacterStateLoadingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$CharacterStateLoadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterStateLoading);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharacterState.loading()';
}


}




/// @nodoc
@JsonSerializable()

class CharacterStateLoaded implements CharacterState {
  const CharacterStateLoaded({required this.characterLoaded, final  String? $type}): $type = $type ?? 'loaded';
  factory CharacterStateLoaded.fromJson(Map<String, dynamic> json) => _$CharacterStateLoadedFromJson(json);

 final  Character characterLoaded;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CharacterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterStateLoadedCopyWith<CharacterStateLoaded> get copyWith => _$CharacterStateLoadedCopyWithImpl<CharacterStateLoaded>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterStateLoadedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterStateLoaded&&(identical(other.characterLoaded, characterLoaded) || other.characterLoaded == characterLoaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,characterLoaded);

@override
String toString() {
  return 'CharacterState.loaded(characterLoaded: $characterLoaded)';
}


}

/// @nodoc
abstract mixin class $CharacterStateLoadedCopyWith<$Res> implements $CharacterStateCopyWith<$Res> {
  factory $CharacterStateLoadedCopyWith(CharacterStateLoaded value, $Res Function(CharacterStateLoaded) _then) = _$CharacterStateLoadedCopyWithImpl;
@useResult
$Res call({
 Character characterLoaded
});


$CharacterCopyWith<$Res> get characterLoaded;

}
/// @nodoc
class _$CharacterStateLoadedCopyWithImpl<$Res>
    implements $CharacterStateLoadedCopyWith<$Res> {
  _$CharacterStateLoadedCopyWithImpl(this._self, this._then);

  final CharacterStateLoaded _self;
  final $Res Function(CharacterStateLoaded) _then;

/// Create a copy of CharacterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? characterLoaded = null,}) {
  return _then(CharacterStateLoaded(
characterLoaded: null == characterLoaded ? _self.characterLoaded : characterLoaded // ignore: cast_nullable_to_non_nullable
as Character,
  ));
}

/// Create a copy of CharacterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterCopyWith<$Res> get characterLoaded {
  
  return $CharacterCopyWith<$Res>(_self.characterLoaded, (value) {
    return _then(_self.copyWith(characterLoaded: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class CharacterStateError implements CharacterState {
  const CharacterStateError({final  String? $type}): $type = $type ?? 'error';
  factory CharacterStateError.fromJson(Map<String, dynamic> json) => _$CharacterStateErrorFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$CharacterStateErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterStateError);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharacterState.error()';
}


}




// dart format on
