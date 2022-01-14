import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistCardShimmerLoadingView extends StatelessWidget {
  const SpecialistCardShimmerLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: List.generate(3, (index) {
        return Container(
          height: 150.h,
          width: 115.w,
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppTheme.colors.shimmerColor,
            borderRadius: BorderRadius.circular(12.0.r),
          ),
        );
      }),
    );
  }
}
