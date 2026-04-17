import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/workout_details_screen/widget/panel/exercises_list.dart';
import 'package:fitness_flutter/screens/workout_details_screen/widget/panel/workout_tag.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPanel extends StatelessWidget {
  final WorkoutData workout;

  WorkoutDetailsPanel({required this.workout});

  @override
  Widget build(BuildContext context) {
    return _createPanelData();
  }

  Widget _createPanelData() {
    return Column(
      children: [
        const SizedBox(height: 15),
        _createGrabber(),
        const SizedBox(height: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createHeader(),
              const SizedBox(height: 20),
              _createWorkoutData(),
              SizedBox(height: 20),
              _createExerciesList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createGrabber() {
    return Container(
      width: 72,
      height: 6,
      decoration: BoxDecoration(color: ColorConstants.surfaceBorder, borderRadius: BorderRadius.circular(999)),
    );
  }

  Widget _createHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        workout.title + "  " + TextConstants.workout,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: ColorConstants.whiteOnDark,
        ),
      ),
    );
  }

  Widget _createWorkoutData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          WorkoutTag(
            icon: PathConstants.timeTracker,
            content: "${workout.minutes}:00",
          ),
          const SizedBox(width: 15),
          WorkoutTag(
            icon: PathConstants.exerciseTracker,
            content: "${workout.exercices} ${TextConstants.exercisesLowercase}",
          ),
        ],
      ),
    );
  }

  Widget _createExerciesList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ExercisesList(exercises: workout.exerciseDataList, workout: workout),
      ),
    );
  }
}
