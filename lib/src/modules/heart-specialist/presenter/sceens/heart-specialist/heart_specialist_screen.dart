import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/data/services/network_service_impl.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/data/repositories/heart_specialists_repository_impl.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/usecases/get-heart-specialists/get_heart_specialists_usecase_impl.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/presenter/sceens/heart-specialist/view-model/heart_specialist_vm.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/presenter/sceens/heart-specialist/views/heart_specialist_shimmer_loading_view.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/presenter/sceens/heart-specialist/views/heart_specialist_view.dart';

import 'view-model/heart_specialist_state.dart';

class HeartSpecialistScreen extends StatelessWidget {
  HeartSpecialistScreen({Key? key}) : super(key: key);

  static const String routeName = '/heart-specialist';

  final _viewModel = HeartSpecialistVM(GetHeartSpecialistsUsecase(HeartSpecialistsRepositoryImpl(NetworkServiceImpl())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: AppTheme.colors.redDark),
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: _viewModel,
          builder: (context, HeartSpecialistState state, _) => state.when(
            loading: () => ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) => const HeartSpecialistShimmerLoadingView(),
            ),
            loaded: (state) => HeartSpecialistView(
              heartSpecialist: state,
            ),
            failure: (failureMessage) => Center(child: Text(failureMessage)),
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
