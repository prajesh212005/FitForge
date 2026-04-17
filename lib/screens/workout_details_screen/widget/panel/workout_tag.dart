import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:flutter/material.dart';

class WorkoutTag extends StatelessWidget {
  final String icon;
  final String content;

  WorkoutTag({required this.icon, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: ColorConstants.primaryColor.withOpacity(0.14),
        border: Border.all(color: ColorConstants.primaryColor.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Image.asset(icon, height: 17, width: 17, fit: BoxFit.fill),
          const SizedBox(width: 7),
          Text(content, style: TextStyle(color: ColorConstants.whiteOnDark, fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
