import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:flutter/material.dart';

class HomeStatistics extends StatelessWidget {
  const HomeStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _createComletedWorkouts(context),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _createMiniCard(icon: PathConstants.inProgress, title: TextConstants.inProgress, count: '2', text: TextConstants.workouts)),
              const SizedBox(width: 12),
              Expanded(child: _createMiniCard(icon: PathConstants.timeSent, title: TextConstants.timeSent, count: '62', text: TextConstants.minutes)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createComletedWorkouts(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF112038), Color(0xFF0F1B30)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: ColorConstants.surfaceBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.32),
            blurRadius: 20.0,
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: ColorConstants.goldSoft, borderRadius: BorderRadius.circular(999)),
            child: const Text('TODAY', style: TextStyle(color: ColorConstants.gold, fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 1.2)),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(color: ColorConstants.primaryColor.withOpacity(0.18), borderRadius: BorderRadius.circular(18)),
                child: Image(
                  image: AssetImage(PathConstants.finished),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(TextConstants.finished, style: TextStyle(color: ColorConstants.whiteOnDark, fontSize: 17, fontWeight: FontWeight.w700)),
                    SizedBox(height: 2),
                    Text(TextConstants.completedWorkouts, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF9FB0C7), fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              Text('12', style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, color: ColorConstants.whiteOnDark)),
              SizedBox(width: 8),
              Text('sessions', style: TextStyle(fontSize: 14, color: Color(0xFF9FB0C7))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createMiniCard({required String icon, required String title, required String count, required String text}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: ColorConstants.surface,
        border: Border.all(color: ColorConstants.surfaceBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(image: AssetImage(icon), height: 24),
              const SizedBox(width: 10),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: ColorConstants.whiteOnDark))),
            ],
          ),
          const SizedBox(height: 10),
          Text(count, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: ColorConstants.whiteOnDark)),
          const SizedBox(height: 2),
          Text(text, style: const TextStyle(fontSize: 12, color: ColorConstants.textGrey)),
        ],
      ),
    );
  }
}
