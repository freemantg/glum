// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoryStats {
  int get allStoriesCount => throw _privateConstructorUsedError;
  double get glumAverage => throw _privateConstructorUsedError;
  Map<int, int> get glumDistribution => throw _privateConstructorUsedError;
  Map<DateTime, int> get weeklyGlum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryStatsCopyWith<StoryStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryStatsCopyWith<$Res> {
  factory $StoryStatsCopyWith(
          StoryStats value, $Res Function(StoryStats) then) =
      _$StoryStatsCopyWithImpl<$Res, StoryStats>;
  @useResult
  $Res call(
      {int allStoriesCount,
      double glumAverage,
      Map<int, int> glumDistribution,
      Map<DateTime, int> weeklyGlum});
}

/// @nodoc
class _$StoryStatsCopyWithImpl<$Res, $Val extends StoryStats>
    implements $StoryStatsCopyWith<$Res> {
  _$StoryStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allStoriesCount = null,
    Object? glumAverage = null,
    Object? glumDistribution = null,
    Object? weeklyGlum = null,
  }) {
    return _then(_value.copyWith(
      allStoriesCount: null == allStoriesCount
          ? _value.allStoriesCount
          : allStoriesCount // ignore: cast_nullable_to_non_nullable
              as int,
      glumAverage: null == glumAverage
          ? _value.glumAverage
          : glumAverage // ignore: cast_nullable_to_non_nullable
              as double,
      glumDistribution: null == glumDistribution
          ? _value.glumDistribution
          : glumDistribution // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      weeklyGlum: null == weeklyGlum
          ? _value.weeklyGlum
          : weeklyGlum // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryStatsCopyWith<$Res>
    implements $StoryStatsCopyWith<$Res> {
  factory _$$_StoryStatsCopyWith(
          _$_StoryStats value, $Res Function(_$_StoryStats) then) =
      __$$_StoryStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int allStoriesCount,
      double glumAverage,
      Map<int, int> glumDistribution,
      Map<DateTime, int> weeklyGlum});
}

/// @nodoc
class __$$_StoryStatsCopyWithImpl<$Res>
    extends _$StoryStatsCopyWithImpl<$Res, _$_StoryStats>
    implements _$$_StoryStatsCopyWith<$Res> {
  __$$_StoryStatsCopyWithImpl(
      _$_StoryStats _value, $Res Function(_$_StoryStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allStoriesCount = null,
    Object? glumAverage = null,
    Object? glumDistribution = null,
    Object? weeklyGlum = null,
  }) {
    return _then(_$_StoryStats(
      allStoriesCount: null == allStoriesCount
          ? _value.allStoriesCount
          : allStoriesCount // ignore: cast_nullable_to_non_nullable
              as int,
      glumAverage: null == glumAverage
          ? _value.glumAverage
          : glumAverage // ignore: cast_nullable_to_non_nullable
              as double,
      glumDistribution: null == glumDistribution
          ? _value._glumDistribution
          : glumDistribution // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      weeklyGlum: null == weeklyGlum
          ? _value._weeklyGlum
          : weeklyGlum // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, int>,
    ));
  }
}

/// @nodoc

class _$_StoryStats implements _StoryStats {
  const _$_StoryStats(
      {required this.allStoriesCount,
      required this.glumAverage,
      required final Map<int, int> glumDistribution,
      required final Map<DateTime, int> weeklyGlum})
      : _glumDistribution = glumDistribution,
        _weeklyGlum = weeklyGlum;

  @override
  final int allStoriesCount;
  @override
  final double glumAverage;
  final Map<int, int> _glumDistribution;
  @override
  Map<int, int> get glumDistribution {
    if (_glumDistribution is EqualUnmodifiableMapView) return _glumDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_glumDistribution);
  }

  final Map<DateTime, int> _weeklyGlum;
  @override
  Map<DateTime, int> get weeklyGlum {
    if (_weeklyGlum is EqualUnmodifiableMapView) return _weeklyGlum;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weeklyGlum);
  }

  @override
  String toString() {
    return 'StoryStats(allStoriesCount: $allStoriesCount, glumAverage: $glumAverage, glumDistribution: $glumDistribution, weeklyGlum: $weeklyGlum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryStats &&
            (identical(other.allStoriesCount, allStoriesCount) ||
                other.allStoriesCount == allStoriesCount) &&
            (identical(other.glumAverage, glumAverage) ||
                other.glumAverage == glumAverage) &&
            const DeepCollectionEquality()
                .equals(other._glumDistribution, _glumDistribution) &&
            const DeepCollectionEquality()
                .equals(other._weeklyGlum, _weeklyGlum));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      allStoriesCount,
      glumAverage,
      const DeepCollectionEquality().hash(_glumDistribution),
      const DeepCollectionEquality().hash(_weeklyGlum));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryStatsCopyWith<_$_StoryStats> get copyWith =>
      __$$_StoryStatsCopyWithImpl<_$_StoryStats>(this, _$identity);
}

abstract class _StoryStats implements StoryStats {
  const factory _StoryStats(
      {required final int allStoriesCount,
      required final double glumAverage,
      required final Map<int, int> glumDistribution,
      required final Map<DateTime, int> weeklyGlum}) = _$_StoryStats;

  @override
  int get allStoriesCount;
  @override
  double get glumAverage;
  @override
  Map<int, int> get glumDistribution;
  @override
  Map<DateTime, int> get weeklyGlum;
  @override
  @JsonKey(ignore: true)
  _$$_StoryStatsCopyWith<_$_StoryStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TrendingStats {
  Map<TagModel, int> get trendingTags => throw _privateConstructorUsedError;
  Map<TagModel, int> get trendingMoodsOrGlums =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrendingStatsCopyWith<TrendingStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingStatsCopyWith<$Res> {
  factory $TrendingStatsCopyWith(
          TrendingStats value, $Res Function(TrendingStats) then) =
      _$TrendingStatsCopyWithImpl<$Res, TrendingStats>;
  @useResult
  $Res call(
      {Map<TagModel, int> trendingTags,
      Map<TagModel, int> trendingMoodsOrGlums});
}

/// @nodoc
class _$TrendingStatsCopyWithImpl<$Res, $Val extends TrendingStats>
    implements $TrendingStatsCopyWith<$Res> {
  _$TrendingStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trendingTags = null,
    Object? trendingMoodsOrGlums = null,
  }) {
    return _then(_value.copyWith(
      trendingTags: null == trendingTags
          ? _value.trendingTags
          : trendingTags // ignore: cast_nullable_to_non_nullable
              as Map<TagModel, int>,
      trendingMoodsOrGlums: null == trendingMoodsOrGlums
          ? _value.trendingMoodsOrGlums
          : trendingMoodsOrGlums // ignore: cast_nullable_to_non_nullable
              as Map<TagModel, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrendingStatsCopyWith<$Res>
    implements $TrendingStatsCopyWith<$Res> {
  factory _$$_TrendingStatsCopyWith(
          _$_TrendingStats value, $Res Function(_$_TrendingStats) then) =
      __$$_TrendingStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<TagModel, int> trendingTags,
      Map<TagModel, int> trendingMoodsOrGlums});
}

/// @nodoc
class __$$_TrendingStatsCopyWithImpl<$Res>
    extends _$TrendingStatsCopyWithImpl<$Res, _$_TrendingStats>
    implements _$$_TrendingStatsCopyWith<$Res> {
  __$$_TrendingStatsCopyWithImpl(
      _$_TrendingStats _value, $Res Function(_$_TrendingStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trendingTags = null,
    Object? trendingMoodsOrGlums = null,
  }) {
    return _then(_$_TrendingStats(
      trendingTags: null == trendingTags
          ? _value._trendingTags
          : trendingTags // ignore: cast_nullable_to_non_nullable
              as Map<TagModel, int>,
      trendingMoodsOrGlums: null == trendingMoodsOrGlums
          ? _value._trendingMoodsOrGlums
          : trendingMoodsOrGlums // ignore: cast_nullable_to_non_nullable
              as Map<TagModel, int>,
    ));
  }
}

/// @nodoc

class _$_TrendingStats implements _TrendingStats {
  const _$_TrendingStats(
      {required final Map<TagModel, int> trendingTags,
      required final Map<TagModel, int> trendingMoodsOrGlums})
      : _trendingTags = trendingTags,
        _trendingMoodsOrGlums = trendingMoodsOrGlums;

  final Map<TagModel, int> _trendingTags;
  @override
  Map<TagModel, int> get trendingTags {
    if (_trendingTags is EqualUnmodifiableMapView) return _trendingTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_trendingTags);
  }

  final Map<TagModel, int> _trendingMoodsOrGlums;
  @override
  Map<TagModel, int> get trendingMoodsOrGlums {
    if (_trendingMoodsOrGlums is EqualUnmodifiableMapView)
      return _trendingMoodsOrGlums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_trendingMoodsOrGlums);
  }

  @override
  String toString() {
    return 'TrendingStats(trendingTags: $trendingTags, trendingMoodsOrGlums: $trendingMoodsOrGlums)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrendingStats &&
            const DeepCollectionEquality()
                .equals(other._trendingTags, _trendingTags) &&
            const DeepCollectionEquality()
                .equals(other._trendingMoodsOrGlums, _trendingMoodsOrGlums));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_trendingTags),
      const DeepCollectionEquality().hash(_trendingMoodsOrGlums));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrendingStatsCopyWith<_$_TrendingStats> get copyWith =>
      __$$_TrendingStatsCopyWithImpl<_$_TrendingStats>(this, _$identity);
}

abstract class _TrendingStats implements TrendingStats {
  const factory _TrendingStats(
          {required final Map<TagModel, int> trendingTags,
          required final Map<TagModel, int> trendingMoodsOrGlums}) =
      _$_TrendingStats;

  @override
  Map<TagModel, int> get trendingTags;
  @override
  Map<TagModel, int> get trendingMoodsOrGlums;
  @override
  @JsonKey(ignore: true)
  _$$_TrendingStatsCopyWith<_$_TrendingStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StatsState {
  StoryStats get storyStats => throw _privateConstructorUsedError;
  TrendingStats get trendingStats => throw _privateConstructorUsedError;
  Map<DateTime, int> get yearInGlums => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<String> get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatsStateCopyWith<StatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsStateCopyWith<$Res> {
  factory $StatsStateCopyWith(
          StatsState value, $Res Function(StatsState) then) =
      _$StatsStateCopyWithImpl<$Res, StatsState>;
  @useResult
  $Res call(
      {StoryStats storyStats,
      TrendingStats trendingStats,
      Map<DateTime, int> yearInGlums,
      bool isLoading,
      Option<String> errorMessage});

  $StoryStatsCopyWith<$Res> get storyStats;
  $TrendingStatsCopyWith<$Res> get trendingStats;
}

/// @nodoc
class _$StatsStateCopyWithImpl<$Res, $Val extends StatsState>
    implements $StatsStateCopyWith<$Res> {
  _$StatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storyStats = null,
    Object? trendingStats = null,
    Object? yearInGlums = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      storyStats: null == storyStats
          ? _value.storyStats
          : storyStats // ignore: cast_nullable_to_non_nullable
              as StoryStats,
      trendingStats: null == trendingStats
          ? _value.trendingStats
          : trendingStats // ignore: cast_nullable_to_non_nullable
              as TrendingStats,
      yearInGlums: null == yearInGlums
          ? _value.yearInGlums
          : yearInGlums // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, int>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as Option<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryStatsCopyWith<$Res> get storyStats {
    return $StoryStatsCopyWith<$Res>(_value.storyStats, (value) {
      return _then(_value.copyWith(storyStats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TrendingStatsCopyWith<$Res> get trendingStats {
    return $TrendingStatsCopyWith<$Res>(_value.trendingStats, (value) {
      return _then(_value.copyWith(trendingStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StatsStateCopyWith<$Res>
    implements $StatsStateCopyWith<$Res> {
  factory _$$_StatsStateCopyWith(
          _$_StatsState value, $Res Function(_$_StatsState) then) =
      __$$_StatsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StoryStats storyStats,
      TrendingStats trendingStats,
      Map<DateTime, int> yearInGlums,
      bool isLoading,
      Option<String> errorMessage});

  @override
  $StoryStatsCopyWith<$Res> get storyStats;
  @override
  $TrendingStatsCopyWith<$Res> get trendingStats;
}

/// @nodoc
class __$$_StatsStateCopyWithImpl<$Res>
    extends _$StatsStateCopyWithImpl<$Res, _$_StatsState>
    implements _$$_StatsStateCopyWith<$Res> {
  __$$_StatsStateCopyWithImpl(
      _$_StatsState _value, $Res Function(_$_StatsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storyStats = null,
    Object? trendingStats = null,
    Object? yearInGlums = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_StatsState(
      storyStats: null == storyStats
          ? _value.storyStats
          : storyStats // ignore: cast_nullable_to_non_nullable
              as StoryStats,
      trendingStats: null == trendingStats
          ? _value.trendingStats
          : trendingStats // ignore: cast_nullable_to_non_nullable
              as TrendingStats,
      yearInGlums: null == yearInGlums
          ? _value._yearInGlums
          : yearInGlums // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, int>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as Option<String>,
    ));
  }
}

/// @nodoc

class _$_StatsState implements _StatsState {
  const _$_StatsState(
      {required this.storyStats,
      required this.trendingStats,
      required final Map<DateTime, int> yearInGlums,
      required this.isLoading,
      required this.errorMessage})
      : _yearInGlums = yearInGlums;

  @override
  final StoryStats storyStats;
  @override
  final TrendingStats trendingStats;
  final Map<DateTime, int> _yearInGlums;
  @override
  Map<DateTime, int> get yearInGlums {
    if (_yearInGlums is EqualUnmodifiableMapView) return _yearInGlums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_yearInGlums);
  }

  @override
  final bool isLoading;
  @override
  final Option<String> errorMessage;

  @override
  String toString() {
    return 'StatsState(storyStats: $storyStats, trendingStats: $trendingStats, yearInGlums: $yearInGlums, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatsState &&
            (identical(other.storyStats, storyStats) ||
                other.storyStats == storyStats) &&
            (identical(other.trendingStats, trendingStats) ||
                other.trendingStats == trendingStats) &&
            const DeepCollectionEquality()
                .equals(other._yearInGlums, _yearInGlums) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      storyStats,
      trendingStats,
      const DeepCollectionEquality().hash(_yearInGlums),
      isLoading,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatsStateCopyWith<_$_StatsState> get copyWith =>
      __$$_StatsStateCopyWithImpl<_$_StatsState>(this, _$identity);
}

abstract class _StatsState implements StatsState {
  const factory _StatsState(
      {required final StoryStats storyStats,
      required final TrendingStats trendingStats,
      required final Map<DateTime, int> yearInGlums,
      required final bool isLoading,
      required final Option<String> errorMessage}) = _$_StatsState;

  @override
  StoryStats get storyStats;
  @override
  TrendingStats get trendingStats;
  @override
  Map<DateTime, int> get yearInGlums;
  @override
  bool get isLoading;
  @override
  Option<String> get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_StatsStateCopyWith<_$_StatsState> get copyWith =>
      throw _privateConstructorUsedError;
}
