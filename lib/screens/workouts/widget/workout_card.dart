import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/workouts/bloc/workouts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutData workout;
  WorkoutCard({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<WorkoutsBloc>(context);
    return Container(
      width: double.infinity,
      height: 168,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [ColorConstants.surface, ColorConstants.surfaceAlt],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: ColorConstants.surfaceBorder),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.28), blurRadius: 18.0, spreadRadius: 0.1)],
      ),
      child: Material(
        color: Colors.transparent,
        child: BlocBuilder<WorkoutsBloc, WorkoutsState>(
          buildWhen: (_, currState) => currState is CardTappedState,
          builder: (context, state) {
            return InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: () {
                bloc.add(CardTappedEvent(workout: workout));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(color: ColorConstants.primaryColor.withOpacity(0.16), borderRadius: BorderRadius.circular(999)),
                            child: Text('${workout.exercices} ${TextConstants.exercisesUppercase}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: ColorConstants.whiteOnDark)),
                          ),
                          const SizedBox(height: 12),
                          Text(workout.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: ColorConstants.whiteOnDark)),
                          const SizedBox(height: 6),
                          Text('${workout.minutes} ${TextConstants.minutes}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: ColorConstants.textGrey)),
                          const Spacer(),
                          Row(
                            children: [
                              Text('${workout.currentProgress}/${workout.progress}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: ColorConstants.whiteOnDark)),
                              const SizedBox(width: 12),
                              Expanded(
                                child: LinearPercentIndicator(
                                  percent: workout.currentProgress / workout.progress,
                                  progressColor: ColorConstants.mint,
                                  backgroundColor: ColorConstants.surfaceBorder,
                                  lineHeight: 8,
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(workout.image, fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
