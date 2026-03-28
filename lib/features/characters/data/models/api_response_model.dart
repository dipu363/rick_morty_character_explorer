import 'character_model.dart';

class ApiResponseModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  final List<CharacterModel> results;

  ApiResponseModel({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
    required this.results,
  });

  factory ApiResponseModel.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseModel(
      count: json['info']['count'],
      pages: json['info']['pages'],
      next: json['info']['next'],
      prev: json['info']['prev'],
      results: (json['results'] as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList(),
    );
  }
}