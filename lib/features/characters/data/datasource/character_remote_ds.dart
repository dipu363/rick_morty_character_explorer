import '../models/api_response_model.dart';
import '../../../../core/network/api_service.dart';

class CharacterRemoteDataSource {
  final ApiService apiService;

  CharacterRemoteDataSource({
    required this.apiService,
  });

  Future<ApiResponseModel> fetchCharacters(
      int page) async {
    return await apiService.fetchCharacters(
      page: page,
    );
  }
}