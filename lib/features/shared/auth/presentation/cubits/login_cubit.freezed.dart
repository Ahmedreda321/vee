// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loading,
    required TResult Function(LoginSuccess<T> value) success,
    required TResult Function(LoginError<T> value) error,
    required TResult Function(ResetPassword<T> value) resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loading,
    TResult? Function(LoginSuccess<T> value)? success,
    TResult? Function(LoginError<T> value)? error,
    TResult? Function(ResetPassword<T> value)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loading,
    TResult Function(LoginSuccess<T> value)? success,
    TResult Function(LoginError<T> value)? error,
    TResult Function(ResetPassword<T> value)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<T, $Res> {
  factory $LoginStateCopyWith(
          LoginState<T> value, $Res Function(LoginState<T>) then) =
      _$LoginStateCopyWithImpl<T, $Res, LoginState<T>>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<T, $Res, $Val extends LoginState<T>>
    implements $LoginStateCopyWith<T, $Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginInitialImplCopyWith<T, $Res> {
  factory _$$LoginInitialImplCopyWith(_$LoginInitialImpl<T> value,
          $Res Function(_$LoginInitialImpl<T>) then) =
      __$$LoginInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoginInitialImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$LoginInitialImpl<T>>
    implements _$$LoginInitialImplCopyWith<T, $Res> {
  __$$LoginInitialImplCopyWithImpl(
      _$LoginInitialImpl<T> _value, $Res Function(_$LoginInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginInitialImpl<T> implements LoginInitial<T> {
  const _$LoginInitialImpl();

  @override
  String toString() {
    return 'LoginState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() resetPassword,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? resetPassword,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loading,
    required TResult Function(LoginSuccess<T> value) success,
    required TResult Function(LoginError<T> value) error,
    required TResult Function(ResetPassword<T> value) resetPassword,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loading,
    TResult? Function(LoginSuccess<T> value)? success,
    TResult? Function(LoginError<T> value)? error,
    TResult? Function(ResetPassword<T> value)? resetPassword,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loading,
    TResult Function(LoginSuccess<T> value)? success,
    TResult Function(LoginError<T> value)? error,
    TResult Function(ResetPassword<T> value)? resetPassword,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LoginInitial<T> implements LoginState<T> {
  const factory LoginInitial() = _$LoginInitialImpl<T>;
}

/// @nodoc
abstract class _$$LoginLoadingImplCopyWith<T, $Res> {
  factory _$$LoginLoadingImplCopyWith(_$LoginLoadingImpl<T> value,
          $Res Function(_$LoginLoadingImpl<T>) then) =
      __$$LoginLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoginLoadingImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$LoginLoadingImpl<T>>
    implements _$$LoginLoadingImplCopyWith<T, $Res> {
  __$$LoginLoadingImplCopyWithImpl(
      _$LoginLoadingImpl<T> _value, $Res Function(_$LoginLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginLoadingImpl<T> implements LoginLoading<T> {
  const _$LoginLoadingImpl();

  @override
  String toString() {
    return 'LoginState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() resetPassword,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? resetPassword,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loading,
    required TResult Function(LoginSuccess<T> value) success,
    required TResult Function(LoginError<T> value) error,
    required TResult Function(ResetPassword<T> value) resetPassword,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loading,
    TResult? Function(LoginSuccess<T> value)? success,
    TResult? Function(LoginError<T> value)? error,
    TResult? Function(ResetPassword<T> value)? resetPassword,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loading,
    TResult Function(LoginSuccess<T> value)? success,
    TResult Function(LoginError<T> value)? error,
    TResult Function(ResetPassword<T> value)? resetPassword,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginLoading<T> implements LoginState<T> {
  const factory LoginLoading() = _$LoginLoadingImpl<T>;
}

/// @nodoc
abstract class _$$LoginSuccessImplCopyWith<T, $Res> {
  factory _$$LoginSuccessImplCopyWith(_$LoginSuccessImpl<T> value,
          $Res Function(_$LoginSuccessImpl<T>) then) =
      __$$LoginSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$LoginSuccessImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$LoginSuccessImpl<T>>
    implements _$$LoginSuccessImplCopyWith<T, $Res> {
  __$$LoginSuccessImplCopyWithImpl(
      _$LoginSuccessImpl<T> _value, $Res Function(_$LoginSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$LoginSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoginSuccessImpl<T> implements LoginSuccess<T> {
  const _$LoginSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'LoginState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSuccessImplCopyWith<T, _$LoginSuccessImpl<T>> get copyWith =>
      __$$LoginSuccessImplCopyWithImpl<T, _$LoginSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() resetPassword,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? resetPassword,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loading,
    required TResult Function(LoginSuccess<T> value) success,
    required TResult Function(LoginError<T> value) error,
    required TResult Function(ResetPassword<T> value) resetPassword,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loading,
    TResult? Function(LoginSuccess<T> value)? success,
    TResult? Function(LoginError<T> value)? error,
    TResult? Function(ResetPassword<T> value)? resetPassword,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loading,
    TResult Function(LoginSuccess<T> value)? success,
    TResult Function(LoginError<T> value)? error,
    TResult Function(ResetPassword<T> value)? resetPassword,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoginSuccess<T> implements LoginState<T> {
  const factory LoginSuccess(final T data) = _$LoginSuccessImpl<T>;

  T get data;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginSuccessImplCopyWith<T, _$LoginSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginErrorImplCopyWith<T, $Res> {
  factory _$$LoginErrorImplCopyWith(
          _$LoginErrorImpl<T> value, $Res Function(_$LoginErrorImpl<T>) then) =
      __$$LoginErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoginErrorImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$LoginErrorImpl<T>>
    implements _$$LoginErrorImplCopyWith<T, $Res> {
  __$$LoginErrorImplCopyWithImpl(
      _$LoginErrorImpl<T> _value, $Res Function(_$LoginErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoginErrorImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginErrorImpl<T> implements LoginError<T> {
  const _$LoginErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LoginState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginErrorImplCopyWith<T, _$LoginErrorImpl<T>> get copyWith =>
      __$$LoginErrorImplCopyWithImpl<T, _$LoginErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() resetPassword,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? resetPassword,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loading,
    required TResult Function(LoginSuccess<T> value) success,
    required TResult Function(LoginError<T> value) error,
    required TResult Function(ResetPassword<T> value) resetPassword,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loading,
    TResult? Function(LoginSuccess<T> value)? success,
    TResult? Function(LoginError<T> value)? error,
    TResult? Function(ResetPassword<T> value)? resetPassword,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loading,
    TResult Function(LoginSuccess<T> value)? success,
    TResult Function(LoginError<T> value)? error,
    TResult Function(ResetPassword<T> value)? resetPassword,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoginError<T> implements LoginState<T> {
  const factory LoginError(final String message) = _$LoginErrorImpl<T>;

  String get message;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginErrorImplCopyWith<T, _$LoginErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordImplCopyWith<T, $Res> {
  factory _$$ResetPasswordImplCopyWith(_$ResetPasswordImpl<T> value,
          $Res Function(_$ResetPasswordImpl<T>) then) =
      __$$ResetPasswordImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResetPasswordImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$ResetPasswordImpl<T>>
    implements _$$ResetPasswordImplCopyWith<T, $Res> {
  __$$ResetPasswordImplCopyWithImpl(_$ResetPasswordImpl<T> _value,
      $Res Function(_$ResetPasswordImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetPasswordImpl<T> implements ResetPassword<T> {
  const _$ResetPasswordImpl();

  @override
  String toString() {
    return 'LoginState<$T>.resetPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetPasswordImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() resetPassword,
  }) {
    return resetPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? resetPassword,
  }) {
    return resetPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loading,
    required TResult Function(LoginSuccess<T> value) success,
    required TResult Function(LoginError<T> value) error,
    required TResult Function(ResetPassword<T> value) resetPassword,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loading,
    TResult? Function(LoginSuccess<T> value)? success,
    TResult? Function(LoginError<T> value)? error,
    TResult? Function(ResetPassword<T> value)? resetPassword,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loading,
    TResult Function(LoginSuccess<T> value)? success,
    TResult Function(LoginError<T> value)? error,
    TResult Function(ResetPassword<T> value)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class ResetPassword<T> implements LoginState<T> {
  const factory ResetPassword() = _$ResetPasswordImpl<T>;
}
