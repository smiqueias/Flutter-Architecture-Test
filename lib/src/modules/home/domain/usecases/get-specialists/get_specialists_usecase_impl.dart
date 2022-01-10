import 'package:flutter_architecture_test/src/modules/home/domain/entities/specialist_entity.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/repositories/specialists_repository.dart';

import 'get_specialists_usecase.dart';

class GetSpecialistsUseCaseImpl implements GetSpecialistsUseCase {
  final SpecialistsRepository specialistsRepository;

  GetSpecialistsUseCaseImpl(this.specialistsRepository);

  @override
  Future<List<SpecialistEntity>> getSpecialists() {
    return specialistsRepository.getSpecialists();
  }
}
