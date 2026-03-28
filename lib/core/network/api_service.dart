import 'package:dio/dio.dart';
import '../../features/characters/data/models/api_response_model.dart';
import 'dio_client.dart';

class ApiService {
  final Dio _dio = DioClient.createDio();

  Future<ApiResponseModel> fetchCharacters({required int page}) async {
    try {
      final response = await _dio.get(
        'character',
        queryParameters: {'page': page},
      );

      return ApiResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("API Error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }
}
