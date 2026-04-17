import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:flutter/material.dart';

class FitnessButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Function() onTap;

  FitnessButton({required this.title, this.isEnabled = true, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        gradient: isEnabled
            ? LinearGradient(
                colors: [ColorConstants.primaryColor, ColorConstants.accent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: isEnabled ? null : ColorConstants.disabledColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: ColorConstants.primaryColor.withOpacity(0.28),
                  blurRadius: 24,
                  offset: Offset(0, 10),
                ),
              ]
            : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: isEnabled ? onTap : null,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: ColorConstants.whiteOnDark,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
