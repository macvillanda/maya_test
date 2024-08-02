// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_amount_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendAmountState {
  bool get isLoading => throw _privateConstructorUsedError;
  DataEntity? get sentAmount => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendAmountStateCopyWith<SendAmountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendAmountStateCopyWith<$Res> {
  factory $SendAmountStateCopyWith(
          SendAmountState value, $Res Function(SendAmountState) then) =
      _$SendAmountStateCopyWithImpl<$Res, SendAmountState>;
  @useResult
  $Res call({bool isLoading, DataEntity? sentAmount, Exception? error});
}

/// @nodoc
class _$SendAmountStateCopyWithImpl<$Res, $Val extends SendAmountState>
    implements $SendAmountStateCopyWith<$Res> {
  _$SendAmountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? sentAmount = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAmount: freezed == sentAmount
          ? _value.sentAmount
          : sentAmount // ignore: cast_nullable_to_non_nullable
              as DataEntity?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendAmountStateImplCopyWith<$Res>
    implements $SendAmountStateCopyWith<$Res> {
  factory _$$SendAmountStateImplCopyWith(_$SendAmountStateImpl value,
          $Res Function(_$SendAmountStateImpl) then) =
      __$$SendAmountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, DataEntity? sentAmount, Exception? error});
}

/// @nodoc
class __$$SendAmountStateImplCopyWithImpl<$Res>
    extends _$SendAmountStateCopyWithImpl<$Res, _$SendAmountStateImpl>
    implements _$$SendAmountStateImplCopyWith<$Res> {
  __$$SendAmountStateImplCopyWithImpl(
      _$SendAmountStateImpl _value, $Res Function(_$SendAmountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? sentAmount = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SendAmountStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAmount: freezed == sentAmount
          ? _value.sentAmount
          : sentAmount // ignore: cast_nullable_to_non_nullable
              as DataEntity?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$SendAmountStateImpl implements _SendAmountState {
  const _$SendAmountStateImpl(
      {this.isLoading = false, this.sentAmount, this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DataEntity? sentAmount;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'SendAmountState(isLoading: $isLoading, sentAmount: $sentAmount, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendAmountStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.sentAmount, sentAmount) ||
                other.sentAmount == sentAmount) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, sentAmount, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendAmountStateImplCopyWith<_$SendAmountStateImpl> get copyWith =>
      __$$SendAmountStateImplCopyWithImpl<_$SendAmountStateImpl>(
          this, _$identity);
}

abstract class _SendAmountState implements SendAmountState {
  const factory _SendAmountState(
      {final bool isLoading,
      final DataEntity? sentAmount,
      final Exception? error}) = _$SendAmountStateImpl;

  @override
  bool get isLoading;
  @override
  DataEntity? get sentAmount;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$SendAmountStateImplCopyWith<_$SendAmountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
