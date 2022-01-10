import 'package:dio/dio.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/usecases/get-specialists/get_specialists_usecase.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/home/bloc/specialist_card_state.dart';
import 'package:flutter_architecture_test/src/utils/log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialistCardBloc extends Cubit<SpecialistCardState> {
  final GetSpecialistsUseCase _getSpecialistsUseCase;

  SpecialistCardBloc(this._getSpecialistsUseCase) : super(SpecialistCardInitial()) {
    getSpecialists();
  }

  Future<void> getSpecialists() async {
    try {
      emit(SpecialistCardLoading());
      await Future.delayed(const Duration(seconds: 2));
      final specialist = await _getSpecialistsUseCase.getSpecialists();
      emit(SpecialistCardLoaded(specialist));
    } on DioError catch (e, st) {
      Log.log(
        "Error in SpecialistCardBloc",
        error: e,
        stackTrace: st,
      );
      if (e.type == DioErrorType.other) {
        emit(const SpecialistCardFailure('Connection timeout, please check your internet connection'));
      } else {
        emit(const SpecialistCardFailure('Ocorreu uym erro'));
      }
    }
  }
}
