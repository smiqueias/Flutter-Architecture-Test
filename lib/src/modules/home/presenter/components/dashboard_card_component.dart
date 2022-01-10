import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardCardComponent extends StatelessWidget {
  final String label;
  final String assetName;
  final bool enabled;
  final Function() onTap;

  const DashboardCardComponent({
    Key? key,
    required this.label,
    required this.assetName,
    required this.enabled,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: enabled ? AppTheme.colors.magenta : AppTheme.colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetName,
              height: 55.h,
              color: enabled ? AppTheme.colors.white : AppTheme.colors.magenta,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: enabled
                  ? AppTheme.textStyles.ubuntuRegular14.apply(
                      color: AppTheme.colors.white,
                    )
                  : AppTheme.textStyles.ubuntuRegular14.apply(
                      color: AppTheme.colors.magenta,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
