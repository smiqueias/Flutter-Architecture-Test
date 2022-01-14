import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/domain/entities/heart_specialist_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartSpecialistCardComponent extends StatelessWidget {
  final List<HeartSpecialistEntity> heartSpecialist;
  final int index;

  const HeartSpecialistCardComponent({
    Key? key,
    required this.heartSpecialist,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppTheme.colors.pink.withOpacity(0.5),
        child: Text(
          '${heartSpecialist[index].name.split(" ")[0][0]}${heartSpecialist[index].name.split(" ").length > 1 ? heartSpecialist[index].name.split(" ")[1][0] : ""}',
          style: TextStyle(color: AppTheme.colors.pink, fontWeight: FontWeight.bold),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heartSpecialist[index].name,
            style: AppTheme.textStyles.ubuntuRegular16Bold,
          ),
          SizedBox(height: 10.0.h),
          Text(
            "Nearby ${heartSpecialist[index].distance}",
            style: AppTheme.textStyles.ubuntuRegular14.apply(color: AppTheme.colors.blueCyan),
          ),
          SizedBox(height: 10.0.h),
          Text(
            "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Cras nec est lorem. Duis nec.",
            overflow: TextOverflow.fade,
            style: AppTheme.textStyles.ubuntuRegular14.apply(color: AppTheme.colors.blueCyan2),
          ),
          SizedBox(height: 30.0.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60.0.h),
                ),
                onPressed: () => print("CHAT"),
                child: Text(
                  'Chat',
                  style: AppTheme.textStyles.ubuntuRegular18Bold.apply(color: AppTheme.colors.white),
                ),
              ),
              SizedBox(width: 10.0.w),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 60.0.h),
                ),
                onPressed: () => print("CALL"),
                child: Text(
                  'Call',
                  style: AppTheme.textStyles.ubuntuRegular18Bold.apply(color: AppTheme.colors.blueCyan),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
