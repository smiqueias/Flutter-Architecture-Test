import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/data/services/network_service_impl.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_architecture_test/src/modules/home/data/repositories/specialists_repository_impl.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/usecases/get-specialists/get_specialists_usecase_impl.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/home/views/specialist_card_shimmer_loading_view.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/home/view-model/specialist_card_state.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/home/view-model/specialist_card_vm.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/home/views/error_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/dashboard_card_component.dart';
import 'views/specialists_cards_view.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  final currentIndex = ValueNotifier<int>(0);

  SpecialistCardVM viewModel = SpecialistCardVM(GetSpecialistsUseCaseImpl(SpecialistsRepositoryImpl(NetworkServiceImpl())));

  _onItemTapped(int index) => currentIndex.value = index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: "Olá, \n",
                  style: AppTheme.textStyles.ubuntuRegular16,
                  children: [
                    TextSpan(
                      text: "Saulo",
                      style: AppTheme.textStyles.ubuntuBold,
                    )
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                "Especialistas",
                style: AppTheme.textStyles.ubuntuRegular16Bold,
              ),
              SizedBox(height: 10.h),
              ValueListenableBuilder(
                valueListenable: viewModel,
                builder: (context, SpecialistCardState state, _) => state.when(
                  loading: () => const SpecialistCardShimmerLoadingView(),
                  loaded: (state) => SpecialistsCardsView(specialists: state),
                  failure: (_) => ErrorView(viewModel: viewModel),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                "O que você precisa?",
                style: AppTheme.textStyles.ubuntuRegular20Bold.apply(color: AppTheme.colors.magenta),
              ),
              SizedBox(height: 50.h),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    AnimatedBuilder(
                      animation: currentIndex,
                      builder: (_, __) {
                        return DashboardCardComponent(
                          label: "Diagnóstico",
                          assetName: AppTheme.icons.stethoscope,
                          enabled: currentIndex.value == 0,
                          onTap: () {
                            _onItemTapped(0);
                          },
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: currentIndex,
                      builder: (_, __) {
                        return DashboardCardComponent(
                          label: "Consulta",
                          assetName: AppTheme.icons.patient,
                          enabled: currentIndex.value == 1,
                          onTap: () {
                            _onItemTapped(1);
                          },
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: currentIndex,
                      builder: (_, __) {
                        return DashboardCardComponent(
                          label: "Enfermeira",
                          assetName: AppTheme.icons.patient,
                          enabled: currentIndex.value == 2,
                          onTap: () {
                            _onItemTapped(2);
                          },
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: currentIndex,
                      builder: (_, __) {
                        return DashboardCardComponent(
                          label: "Ambulância",
                          assetName: AppTheme.icons.ambulance,
                          enabled: currentIndex.value == 3,
                          onTap: () {
                            _onItemTapped(3);
                          },
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: currentIndex,
                      builder: (_, __) {
                        return DashboardCardComponent(
                          label: "Exame laboratorial",
                          assetName: AppTheme.icons.flask,
                          enabled: currentIndex.value == 4,
                          onTap: () {
                            _onItemTapped(4);
                          },
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: currentIndex,
                      builder: (_, __) {
                        return DashboardCardComponent(
                          label: "Remédio",
                          assetName: AppTheme.icons.medicine,
                          enabled: currentIndex.value == 5,
                          onTap: () {
                            _onItemTapped(5);
                          },
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
