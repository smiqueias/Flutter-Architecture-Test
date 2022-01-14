import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/entities/heart_specialist_entity.dart';

abstract class GetHeartSpecialitsUseCase {
  Future<List<HeartSpecialistEntity>> getHeartSpecialists();
}
