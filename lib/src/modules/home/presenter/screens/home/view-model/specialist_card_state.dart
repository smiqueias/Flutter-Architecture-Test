import 'package:equatable/equatable.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/entities/specialist_entity.dart';

typedef Loaded = Function(List<SpecialistEntity> data);
typedef Loading = Function();
typedef Failure = Function(String failureMessage);
typedef OrElse = Function();

abstract class SpecialistCardState extends Equatable {
  const SpecialistCardState();

  dynamic when({Loading? loading, Loaded? loaded, Failure? failure, required OrElse orElse});

  static loading() => SpecialistCardLoading();
  static loaded(List<SpecialistEntity> data) => SpecialistCardLoaded(data);
  static failure(String failureMessage) => SpecialistCardFailure(failureMessage);
}

class SpecialistCardInitial extends SpecialistCardState {
  @override
  List<Object> get props => [];

  @override
  when({Loading? loading, Loaded? loaded, Failure? failure, required OrElse orElse}) {
    return SpecialistCardInitial();
  }
}

class SpecialistCardLoaded extends SpecialistCardState {
  final List<SpecialistEntity> specialistEntity;

  const SpecialistCardLoaded(this.specialistEntity);

  @override
  List<Object?> get props => [specialistEntity];

  @override
  when({Loading? loading, Loaded? loaded, Failure? failure, required OrElse orElse}) {
    if (loaded != null) {
      return loaded(specialistEntity);
    }
    return orElse();
  }
}

class SpecialistCardLoading extends SpecialistCardState {
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

class SpecialistCardFailure extends SpecialistCardState {
  final String failureMessage;

  const SpecialistCardFailure(this.failureMessage);

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
