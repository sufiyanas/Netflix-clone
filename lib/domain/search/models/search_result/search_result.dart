import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/infrastructure/api_keys.dart';

import 'result.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SearchResult({
    this.results = const [],
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return _$SearchResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get posterImageUrl => '$imageAppendUrl$posterPath';
  SearchResultData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
