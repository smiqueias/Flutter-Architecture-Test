import 'package:flutter_architecture_test/src/core/domain/services/network_service.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/entities/heart_specialist_entity.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/repositories/heart_specialists_repository.dart';
import 'package:flutter_architecture_test/src/utils/log.dart';

class HeartSpecialistsRepositoryImpl implements HeartSpecialistsRepository {
  final NetworkService _networkService;

  HeartSpecialistsRepositoryImpl(this._networkService);

  @override
  Future<List<HeartSpecialistEntity>> getHeartSpecialist() async {
    try {
      final response = await _networkService.get<List>("/specialist-heart");
      return response.data!
          .map<HeartSpecialistEntity>((heartSpecialist) => HeartSpecialistEntity.fromJson(heartSpecialist))
          .toList();
    } catch (e, st) {
      Log.log("Error in HeartSpecialistsRepositoryImpl", error: e, stackTrace: st);
      rethrow;
    }
  }
}
