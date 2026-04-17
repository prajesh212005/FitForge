import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/workout_details_screen/bloc/workoutdetails_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailsBody extends StatelessWidget {
  final WorkoutData workout;
  WorkoutDetailsBody({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorConstants.background, ColorConstants.backgroundAlt],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          _createImage(),
          _createBackButton(context),
          _createHeadline(),
        ],
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    final bloc = BlocProvider.of<WorkoutDetailsBloc>(context);
    return Positioned(
      child: SafeArea(
        child: BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
          builder: (context, state) {
            return GestureDetector(
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(color: ColorConstants.surface.withOpacity(0.82), shape: BoxShape.circle, border: Border.all(color: ColorConstants.surfaceBorder)),
                child: const Icon(Icons.arrow_back_rounded, color: ColorConstants.whiteOnDark),
              ),
              onTap: () {
                bloc.add(BackTappedEvent());
              },
            );
          },
        ),
      ),
      left: 20,
      top: 14,
    );
  }

  Widget _createImage() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.45,
        child: Image(
          image: AssetImage(workout.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _createHeadline() {
    return Positioned(
      left: 20,
      right: 20,
      top: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: ColorConstants.primaryColor.withOpacity(0.16), borderRadius: BorderRadius.circular(999)),
            child: const Text('WORKOUT DETAILS', style: TextStyle(color: ColorConstants.mint, fontSize: 11, letterSpacing: 1.2, fontWeight: FontWeight.w800)),
          ),
          const SizedBox(height: 14),
          Text(
            workout.title,
            style: const TextStyle(color: ColorConstants.whiteOnDark, fontSize: 30, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            '${workout.exercices} exercises • ${workout.minutes} minutes',
            style: const TextStyle(color: Color(0xFFD1DAEA), fontSize: 14),
          ),
        ],
      ),
    );
  }
}
