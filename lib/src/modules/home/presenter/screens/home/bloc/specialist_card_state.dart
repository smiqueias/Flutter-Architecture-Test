import 'package:equatable/equatable.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/entities/specialist_entity.dart';

abstract class SpecialistCardState extends Equatable {
  const SpecialistCardState();
}

class SpecialistCardInitial extends SpecialistCardState {
  @override
  List<Object> get props => [];
}

class SpecialistCardLoaded extends SpecialistCardState {
  final List<SpecialistEntity> specialists;

  const SpecialistCardLoaded(this.specialists);

  @override
  List<Object?> get props => [specialists];
}

class SpecialistCardLoading extends SpecialistCardState {
  @override
  List<Object?> get props => [];
}

class SpecialistCardFailure extends SpecialistCardState {
  final String failureMessage;

  const SpecialistCardFailure(this.failureMessage);

  @override
  List<Object?> get props => [failureMessage];
}
