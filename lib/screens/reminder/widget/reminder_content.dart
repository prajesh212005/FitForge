import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/data_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/screens/reminder/bloc/reminder_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderContent extends StatelessWidget {
  const ReminderContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorConstants.background, ColorConstants.backgroundAlt],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: _createDetailedReminder(context),
    );
  }

  Widget _createDetailedReminder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createSelectTime(),
              const SizedBox(height: 16),
              _createTimePicker(context),
              const SizedBox(height: 20),
              _createRepeating(),
              const SizedBox(height: 15),
              _createDayRepeating(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createSelectTime() {
    return const Text(
      TextConstants.selectTime,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: ColorConstants.whiteOnDark,
      ),
    );
  }

  Widget _createTimePicker(BuildContext context) {
    final bloc = BlocProvider.of<ReminderBloc>(context);
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: ColorConstants.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: ColorConstants.surfaceBorder),
      ),
      child: CupertinoTheme(
        data: const CupertinoThemeData(brightness: Brightness.dark),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (DateTime value) {
            bloc.add(ReminderNotificationTimeEvent(dateTime: value));
          },
        ),
      ),
    );
  }

  Widget _createRepeating() {
    return const Text(TextConstants.repeating,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: ColorConstants.whiteOnDark));
  }

  Widget _createDayRepeating(BuildContext context) {
    final bloc = BlocProvider.of<ReminderBloc>(context);
    return BlocBuilder<ReminderBloc, ReminderState>(
      buildWhen: (_, currState) => currState is RepeatDaySelectedState,
      builder: (context, state) {
        return Wrap(
          spacing: 10,
          runSpacing: 15,
          children: [
            for (int i = 0; i < DataConstants.reminderDays.length; i++) ...[
              RepeatingDay(
                title: DataConstants.reminderDays[i],
                isSelected: bloc.selectedRepeatDayIndex == i,
                onTap: () {
                  bloc.add(RepeatDaySelectedEvent(
                      index: i, dayTime: bloc.dayTime = i));
                },
              ),
            ],
          ],
        );
      },
    );
  }
}

class RepeatingDay extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  RepeatingDay({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorConstants.primaryColor.withOpacity(0.22)
              : ColorConstants.surface,
          border: Border.all(color: isSelected ? ColorConstants.primaryColor : ColorConstants.surfaceBorder),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? ColorConstants.whiteOnDark : ColorConstants.textGrey,
          ),
        ),
      ),
    );
  }
}
