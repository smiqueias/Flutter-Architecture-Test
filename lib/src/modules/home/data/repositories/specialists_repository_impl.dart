import 'package:flutter_architecture_test/src/core/domain/services/network_service.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/entities/specialist_entity.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/repositories/specialists_repository.dart';
import 'package:flutter_architecture_test/src/utils/log.dart';

class SpecialistsRepositoryImpl implements SpecialistsRepository {
  final NetworkService _networkService;

  SpecialistsRepositoryImpl(this._networkService);

  @override
  Future<List<SpecialistEntity>> getSpecialists() async {
    try {
      final response = await _networkService.get<List>("/home-specialists");
      return response.data!.map<SpecialistEntity>((specialist) => SpecialistEntity.fromJson(specialist)).toList();
    } catch (e, st) {
      Log.log("Error in SpecialistsRepositoryImpl", error: e, stackTrace: st);
      rethrow;
    }
  }
}
