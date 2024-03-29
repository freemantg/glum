// Mocks generated by Mockito 5.4.2 from annotations
// in glum_mood_tracker/test/application/core/story_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:glum_mood_tracker/domain/failures/failures.dart' as _i5;
import 'package:glum_mood_tracker/domain/models/models.dart' as _i6;
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [StoryRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockStoryRepository extends _i1.Mock implements _i3.StoryRepository {
  MockStoryRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.StoryFailure, _i2.Unit>> addStory(
          _i6.StoryModel? story) =>
      (super.noSuchMethod(
        Invocation.method(
          #addStory,
          [story],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.StoryFailure, _i2.Unit>>.value(
            _FakeEither_0<_i5.StoryFailure, _i2.Unit>(
          this,
          Invocation.method(
            #addStory,
            [story],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.StoryFailure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i5.StoryFailure, _i2.Unit>> deleteStory(
          int? storyId) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteStory,
          [storyId],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.StoryFailure, _i2.Unit>>.value(
            _FakeEither_0<_i5.StoryFailure, _i2.Unit>(
          this,
          Invocation.method(
            #deleteStory,
            [storyId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.StoryFailure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i5.StoryFailure, _i2.Unit>> updateStory(
          _i6.StoryModel? story) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateStory,
          [story],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.StoryFailure, _i2.Unit>>.value(
            _FakeEither_0<_i5.StoryFailure, _i2.Unit>(
          this,
          Invocation.method(
            #updateStory,
            [story],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.StoryFailure, _i2.Unit>>);
  @override
  _i4.Stream<_i2.Either<_i5.StoryFailure, List<_i6.StoryModel>>>
      watchStoriesByMonthYear(DateTime? monthYear) => (super.noSuchMethod(
            Invocation.method(
              #watchStoriesByMonthYear,
              [monthYear],
            ),
            returnValue: _i4.Stream<
                _i2.Either<_i5.StoryFailure, List<_i6.StoryModel>>>.empty(),
          ) as _i4.Stream<_i2.Either<_i5.StoryFailure, List<_i6.StoryModel>>>);
  @override
  _i4.Future<_i2.Either<_i5.StoryFailure, int>> countStories() =>
      (super.noSuchMethod(
        Invocation.method(
          #countStories,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.StoryFailure, int>>.value(
            _FakeEither_0<_i5.StoryFailure, int>(
          this,
          Invocation.method(
            #countStories,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.StoryFailure, int>>);
}
