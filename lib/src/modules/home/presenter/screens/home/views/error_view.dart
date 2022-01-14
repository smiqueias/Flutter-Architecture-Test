import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/home/view-model/specialist_card_vm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorView extends StatelessWidget {
  final SpecialistCardVM viewModel;

  const ErrorView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppTheme.icons.internetConnection,
          height: 100.h,
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ops!",
              style: AppTheme.textStyles.ubuntuRegular14Bold,
            ),
            SizedBox(height: 8.h),
            Text(
              "Parece que houve uma falha\nde conexão com a internet",
              style: AppTheme.textStyles.ubuntuRegular14.apply(color: AppTheme.colors.blueCyan2),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: AppTheme.colors.white,
                primary: AppTheme.colors.redDark,
              ),
              onPressed: () {
                viewModel.getSpecialists();
              },
              child: const Center(
                child: Text("Tentar novamente"),
              ),
            )
          ],
        )
      ],
    );
  }
}
