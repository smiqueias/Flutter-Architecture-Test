import 'package:flutter_architecture_test/src/core/network/dio_service.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/entities/specialist_entity.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/repositories/specialists_repository.dart';
import 'package:flutter_architecture_test/src/utils/log.dart';

class SpecialistsRepositoryImpl implements SpecialistsRepository {
  final DioService _dioService;

  SpecialistsRepositoryImpl(this._dioService);

  @override
  Future<List<SpecialistEntity>> getSpecialists() async {
    try {
      final response = await _dioService.getDio().get("/home-specialists");
      return (response.data as List).map<SpecialistEntity>((specialist) => SpecialistEntity.fromJson(specialist)).toList();
    } catch (e, st) {
      Log.log("Error in SpecialistsRepositoryImpl", error: e, stackTrace: st);
      rethrow;
    }
  }
}
