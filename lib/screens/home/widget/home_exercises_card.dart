import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final Color color;
  final WorkoutData workout;
  final Function() onTap;

  WorkoutCard({
    required this.color,
    required this.workout,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 170,
        width: screenWidth * 0.72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.98), color.withOpacity(0.70)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
          boxShadow: [BoxShadow(color: color.withOpacity(0.26), blurRadius: 20, offset: const Offset(0, 12))],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.16), borderRadius: BorderRadius.circular(999)),
                  child: Text('${workout.exercices} moves', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                ),
                const Spacer(),
                Text(
                  workout.title,
                  style: const TextStyle(
                    color: ColorConstants.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${workout.minutes} minutes of guided flow',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.86),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Positioned(
              right: -8,
              bottom: -8,
              child: Image(
                image: AssetImage(workout.image),
                height: 96,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
