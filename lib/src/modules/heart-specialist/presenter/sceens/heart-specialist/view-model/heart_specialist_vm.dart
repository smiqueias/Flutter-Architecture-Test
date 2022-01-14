import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/usecases/get-heart-specialists/get_heart_specialists_usecase_impl.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/presenter/sceens/heart-specialist/view-model/heart_specialist_state.dart';
import 'package:flutter_architecture_test/src/utils/log.dart';

class HeartSpecialistVM extends ValueNotifier<HeartSpecialistState> {
  final GetHeartSpecialistsUsecase _getHeartSpecialistsUsecase;

  HeartSpecialistVM(this._getHeartSpecialistsUsecase) : super(HeartSpecialistInitial()) {
    getHeartSpecialists();
  }

  Future<void> getHeartSpecialists() async {
    value = const HeartSpecialistLoading();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final heartSpecialists = await _getHeartSpecialistsUsecase.getHeartSpecialists();
      value = HeartSpecialistLoaded(heartSpecialists);
    } on DioError catch (e, st) {
      Log.log(
        "Error in SpecialistCardBloc",
        error: e,
        stackTrace: st,
      );
      if (e.type == DioErrorType.other) {
        value = const HeartSpecialistFailure('Connection timeout, please check your internet connection');
      } else {
        value = const HeartSpecialistFailure('Ocorreu um erro');
      }
    }
  }
}
