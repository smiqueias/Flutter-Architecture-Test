import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartSpecialistShimmerLoadingView extends StatelessWidget {
  const HeartSpecialistShimmerLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(22.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: AppTheme.colors.shimmerColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 15.0.w),
              Container(
                height: 50.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: AppTheme.colors.shimmerColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              )
            ],
          ),
          Container(
            height: 120.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: AppTheme.colors.shimmerColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
          )
        ],
      ),
    );
  }
}
