import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_model.freezed.dart';

@freezed
class TagModel with _$TagModel {
  const TagModel._();
  const factory TagModel({
    required int? id,
    required String title,
  }) = _TagModel;
}
