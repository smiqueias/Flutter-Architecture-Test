import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/entities/heart_specialist_entity.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/repositories/heart_specialists_repository.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/usecases/get-heart-specialists/get_heart_specialists_usecase.dart';

class GetHeartSpecialistsUsecase implements GetHeartSpecialitsUseCase {
  final HeartSpecialistsRepository _heartSpecialistsRepository;

  GetHeartSpecialistsUsecase(this._heartSpecialistsRepository);

  @override
  Future<List<HeartSpecialistEntity>> getHeartSpecialists() {
    return _heartSpecialistsRepository.getHeartSpecialist();
  }
}
