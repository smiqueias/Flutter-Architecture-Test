import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/entities/heart_specialist_entity.dart';

abstract class HeartSpecialistsRepository {
  Future<List<HeartSpecialistEntity>> getHeartSpecialist();
}
