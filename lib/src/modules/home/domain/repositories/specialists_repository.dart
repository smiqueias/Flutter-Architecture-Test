import 'package:flutter_architecture_test/src/modules/home/domain/entities/specialist_entity.dart';

abstract class SpecialistsRepository {
  Future<List<SpecialistEntity>> getSpecialists();
}
