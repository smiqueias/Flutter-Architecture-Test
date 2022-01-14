import 'package:equatable/equatable.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/entities/heart_specialist_entity.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/home/view-model/specialist_card_state.dart';

typedef Loaded = Function(List<HeartSpecialistEntity> data);
typedef Loading = Function();
typedef Failure = Function(String failureMessage);
typedef OrElse = Function();

abstract class HeartSpecialistState extends Equatable {
  const HeartSpecialistState();

  dynamic when({Loading? loading, Loaded? loaded, Failure? failure, required OrElse orElse});

  static loading() => const HeartSpecialistLoading();
  static loaded(List<HeartSpecialistEntity> data) => HeartSpecialistLoaded(data);
  static failure(String failureMessage) => SpecialistCardFailure(failureMessage);
}

class HeartSpecialistInitial extends HeartSpecialistState {
  @override
  List<Object?> get props => [];

  @override
  when({Loading? loading, Loaded? loaded, Failure? failure, required OrElse orElse}) {
    return HeartSpecialistInitial();
  }
}

class HeartSpecialistLoading extends HeartSpecialistState {
  const HeartSpecialistLoading();

  @override
  List<Object?> get props => [];

  @override
  when({Loading? loading, Loaded? loaded, Failure? failure, required OrElse orElse}) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }
}

class HeartSpecialistLoaded extends HeartSpecialistState {
  final List<HeartSpecialistEntity> heartSpecialists;

  const HeartSpecialistLoaded(this.heartSpecialists);

  @override
  List<Object?> get props => [heartSpecialists];

  @override
  when({Loading? loading, Loaded? loaded, Failure? failure, required OrElse orElse}) {
    if (loaded != null) {
      return loaded(heartSpecialists);
    }
    return orElse();
  }
}

class HeartSpecialistFailure extends HeartSpecialistState {
  final String failureMessage;

  const HeartSpecialistFailure(this.failureMessage);

  @override
  List<Object?> get props => [failureMessage];

  @override
  when({Loading? loading, Loaded? loaded, Failure? failure, required OrElse orElse}) {
    if (failure != null) {
      return failure(failureMessage);
    }
    return orElse();
  }
}
