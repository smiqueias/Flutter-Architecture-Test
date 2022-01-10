import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/usecases/get-specialists/get_specialists_usecase.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/home/view-model/specialist_card_state.dart';
import 'package:flutter_architecture_test/src/utils/log.dart';

class SpecialistCardVM extends ValueNotifier<SpecialistCardState> {
  final GetSpecialistsUseCase _getSpecialistsUseCase;

  SpecialistCardVM(this._getSpecialistsUseCase) : super(SpecialistCardInitial()) {
    getSpecialists();
  }

  Future<void> getSpecialists() async {
    value = SpecialistCardLoading();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final specialist = await _getSpecialistsUseCase.getSpecialists();
      value = SpecialistCardLoaded(specialist);
    } on DioError catch (e, st) {
      Log.log(
        "Error in SpecialistCardBloc",
        error: e,
        stackTrace: st,
      );
      if (e.type == DioErrorType.other) {
        value = const SpecialistCardFailure('Connection timeout, please check your internet connection');
      } else {
        value = const SpecialistCardFailure('Ocorreu um erro');
      }
    }
  }
}
