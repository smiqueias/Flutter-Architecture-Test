import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialistCardComponent extends StatelessWidget {
  final String icon;
  final String labelSpecialist;
  final String numberDoctors;
  final Color backgroundColor;
  final Color iconColor;

  const SpecialistCardComponent({
    Key? key,
    required this.icon,
    required this.labelSpecialist,
    required this.numberDoctors,
    required this.backgroundColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('Tapped'),
      child: Container(
        height: 150.h,
        width: 115.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.r),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: AppTheme.colors.magenta.withOpacity(0.5),
              offset: const Offset(0.0, 2.0),
              blurRadius: 5,
            )
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(left: 8.h, top: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppTheme.colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  child: SvgPicture.asset(
                    icon,
                    color: iconColor,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                labelSpecialist,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.textStyles.ubuntuRegular14Bold.apply(color: AppTheme.colors.white),
              ),
              SizedBox(height: 4.h),
              Text(
                'Especialista',
                style: AppTheme.textStyles.ubuntuRegular14Bold.apply(color: AppTheme.colors.white),
              ),
              SizedBox(height: 4.h),
              Text(
                '$numberDoctors Médicos',
                style: AppTheme.textStyles.ubuntuRegular14.apply(color: AppTheme.colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
