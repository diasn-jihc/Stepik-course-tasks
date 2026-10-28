// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CounterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterEvent()';
}


}

/// @nodoc
class $CounterEventCopyWith<$Res>  {
$CounterEventCopyWith(CounterEvent _, $Res Function(CounterEvent) __);
}


/// Adds pattern-matching-related methods to [CounterEvent].
extension CounterEventPatterns on CounterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CounterStartEvent value)?  start,TResult Function( CounterResetEvent value)?  reset,TResult Function( CounterIncrementEvent value)?  increment,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CounterStartEvent() when start != null:
return start(_that);case CounterResetEvent() when reset != null:
return reset(_that);case CounterIncrementEvent() when increment != null:
return increment(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CounterStartEvent value)  start,required TResult Function( CounterResetEvent value)  reset,required TResult Function( CounterIncrementEvent value)  increment,}){
final _that = this;
switch (_that) {
case CounterStartEvent():
return start(_that);case CounterResetEvent():
return reset(_that);case CounterIncrementEvent():
return increment(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CounterStartEvent value)?  start,TResult? Function( CounterResetEvent value)?  reset,TResult? Function( CounterIncrementEvent value)?  increment,}){
final _that = this;
switch (_that) {
case CounterStartEvent() when start != null:
return start(_that);case CounterResetEvent() when reset != null:
return reset(_that);case CounterIncrementEvent() when increment != null:
return increment(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  start,TResult Function()?  reset,TResult Function()?  increment,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CounterStartEvent() when start != null:
return start();case CounterResetEvent() when reset != null:
return reset();case CounterIncrementEvent() when increment != null:
return increment();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  start,required TResult Function()  reset,required TResult Function()  increment,}) {final _that = this;
switch (_that) {
case CounterStartEvent():
return start();case CounterResetEvent():
return reset();case CounterIncrementEvent():
return increment();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  start,TResult? Function()?  reset,TResult? Function()?  increment,}) {final _that = this;
switch (_that) {
case CounterStartEvent() when start != null:
return start();case CounterResetEvent() when reset != null:
return reset();case CounterIncrementEvent() when increment != null:
return increment();case _:
  return null;

}
}

}

/// @nodoc


class CounterStartEvent implements CounterEvent {
  const CounterStartEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterStartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterEvent.start()';
}


}




/// @nodoc


class CounterResetEvent implements CounterEvent {
  const CounterResetEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterResetEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterEvent.reset()';
}


}




/// @nodoc


class CounterIncrementEvent implements CounterEvent {
  const CounterIncrementEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterIncrementEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterEvent.increment()';
}


}




/// @nodoc
mixin _$CounterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterState()';
}


}

/// @nodoc
class $CounterStateCopyWith<$Res>  {
$CounterStateCopyWith(CounterState _, $Res Function(CounterState) __);
}


/// Adds pattern-matching-related methods to [CounterState].
extension CounterStatePatterns on CounterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CounterInitialState value)?  initial,TResult Function( _CounterLoadingState value)?  loading,TResult Function( _CounterLoadedState value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterInitialState() when initial != null:
return initial(_that);case _CounterLoadingState() when loading != null:
return loading(_that);case _CounterLoadedState() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CounterInitialState value)  initial,required TResult Function( _CounterLoadingState value)  loading,required TResult Function( _CounterLoadedState value)  loaded,}){
final _that = this;
switch (_that) {
case _CounterInitialState():
return initial(_that);case _CounterLoadingState():
return loading(_that);case _CounterLoadedState():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CounterInitialState value)?  initial,TResult? Function( _CounterLoadingState value)?  loading,TResult? Function( _CounterLoadedState value)?  loaded,}){
final _that = this;
switch (_that) {
case _CounterInitialState() when initial != null:
return initial(_that);case _CounterLoadingState() when loading != null:
return loading(_that);case _CounterLoadedState() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int counter)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterInitialState() when initial != null:
return initial();case _CounterLoadingState() when loading != null:
return loading();case _CounterLoadedState() when loaded != null:
return loaded(_that.counter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int counter)  loaded,}) {final _that = this;
switch (_that) {
case _CounterInitialState():
return initial();case _CounterLoadingState():
return loading();case _CounterLoadedState():
return loaded(_that.counter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int counter)?  loaded,}) {final _that = this;
switch (_that) {
case _CounterInitialState() when initial != null:
return initial();case _CounterLoadingState() when loading != null:
return loading();case _CounterLoadedState() when loaded != null:
return loaded(_that.counter);case _:
  return null;

}
}

}

/// @nodoc


class _CounterInitialState implements CounterState {
  const _CounterInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterState.initial()';
}


}




/// @nodoc


class _CounterLoadingState implements CounterState {
  const _CounterLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterState.loading()';
}


}




/// @nodoc


class _CounterLoadedState implements CounterState {
  const _CounterLoadedState({required this.counter});
  

 final  int counter;

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterLoadedStateCopyWith<_CounterLoadedState> get copyWith => __$CounterLoadedStateCopyWithImpl<_CounterLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterLoadedState&&(identical(other.counter, counter) || other.counter == counter));
}


@override
int get hashCode => Object.hash(runtimeType,counter);

@override
String toString() {
  return 'CounterState.loaded(counter: $counter)';
}


}

/// @nodoc
abstract mixin class _$CounterLoadedStateCopyWith<$Res> implements $CounterStateCopyWith<$Res> {
  factory _$CounterLoadedStateCopyWith(_CounterLoadedState value, $Res Function(_CounterLoadedState) _then) = __$CounterLoadedStateCopyWithImpl;
@useResult
$Res call({
 int counter
});




}
/// @nodoc
class __$CounterLoadedStateCopyWithImpl<$Res>
    implements _$CounterLoadedStateCopyWith<$Res> {
  __$CounterLoadedStateCopyWithImpl(this._self, this._then);

  final _CounterLoadedState _self;
  final $Res Function(_CounterLoadedState) _then;

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? counter = null,}) {
  return _then(_CounterLoadedState(
counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
