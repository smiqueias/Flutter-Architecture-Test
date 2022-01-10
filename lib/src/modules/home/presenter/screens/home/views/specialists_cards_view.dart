import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_architecture_test/src/modules/home/domain/entities/specialist_entity.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/components/specialist_card_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistsCardsView extends StatelessWidget {
  final List<SpecialistEntity> specialists;

  const SpecialistsCardsView({
    Key? key,
    required this.specialists,
  }) : super(key: key);

  String setSpecialistIcon(int index) {
    switch (index) {
      case 0:
        return AppTheme.icons.heartShapeOutlineLifeline;
      case 1:
        return AppTheme.icons.tooth;
      case 2:
        return AppTheme.icons.pimples;
    }
    return "";
  }

  Color setBackgroundColor(index) {
    switch (index) {
      case 0:
        return AppTheme.colors.red;
      case 1:
        return AppTheme.colors.yellow;
      case 2:
        return AppTheme.colors.purple;
    }
    return AppTheme.colors.white;
  }

  Color setIconColor(int index) {
    switch (index) {
      case 0:
        return AppTheme.colors.red;
      case 1:
        return AppTheme.colors.yellow;
      case 2:
        return AppTheme.colors.purple;
    }
    return AppTheme.colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: SpecialistCardComponent(
              labelSpecialist: specialists[index].name,
              numberDoctors: specialists[index].total.toString(),
              icon: setSpecialistIcon(index),
              backgroundColor: setBackgroundColor(index),
              iconColor: setIconColor(index),
            ),
          );
        },
      ),
    );
  }
}
