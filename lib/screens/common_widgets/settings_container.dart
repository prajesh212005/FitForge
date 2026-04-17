import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  final bool withArrow;
  final Widget child;
  final Function()? onTap;

  SettingsContainer({Key? key, this.withArrow = false, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Row(
                children: [Expanded(child: child), if (withArrow) Icon(Icons.chevron_right_rounded, color: ColorConstants.primaryColor, size: 26)],
              ),
            ),
          ),
        ),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorConstants.surface,
          border: Border.all(color: ColorConstants.surfaceBorder),
          boxShadow: [BoxShadow(color: ColorConstants.background.withOpacity(0.34), blurRadius: 18.0, spreadRadius: 0.2)],
        ),
      ),
    );
  }
}
