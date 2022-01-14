import 'package:flutter_architecture_test/src/modules/home/domain/entities/specialist_entity.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/repositories/specialists_repository.dart';

import 'get_specialists_usecase.dart';

class GetSpecialistsUseCaseImpl implements GetSpecialistsUseCase {
  final SpecialistsRepository _specialistsRepository;

  GetSpecialistsUseCaseImpl(this._specialistsRepository);

  @override
  Future<List<SpecialistEntity>> getSpecialists() {
    return _specialistsRepository.getSpecialists();
  }
}
