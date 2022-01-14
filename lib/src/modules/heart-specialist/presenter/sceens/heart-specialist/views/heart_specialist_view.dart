import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/entities/heart_specialist_entity.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/presenter/sceens/heart-specialist/components/heart_specialist_card_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartSpecialistView extends StatelessWidget {
  final List<HeartSpecialistEntity> heartSpecialist;

  const HeartSpecialistView({
    Key? key,
    required this.heartSpecialist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Heart Specialist',
            style: AppTheme.textStyles.ubuntuRegular16Bold,
          ),
          SizedBox(height: 4.0.h),
          Text(
            '${heartSpecialist.length} médicos foram encontrados',
            style: AppTheme.textStyles.ubuntuRegular14,
          ),
          SizedBox(height: 40.h),
          Expanded(
            child: ListView.separated(
              itemCount: heartSpecialist.length,
              itemBuilder: (context, index) => HeartSpecialistCardComponent(
                heartSpecialist: heartSpecialist,
                index: index,
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
