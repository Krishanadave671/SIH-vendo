import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/providers/weekly_bazzar_provider.dart';

import 'DisplayList.dart';

var today = DateUtils.dateOnly(DateTime.now());
var fetchedDate = DateUtils.dateOnly(DateTime.now()).toString();

class Calendar extends ConsumerStatefulWidget {
  const Calendar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarState();
}

List<DateTime?> _singleDatePickerValueWithDefaultValue = [
  DateTime.now(),
];

final selectedDateProvider = StateProvider<List<DateTime?>>((ref) {
  return _singleDatePickerValueWithDefaultValue;
});

class _CalendarState extends ConsumerState<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: SizedBox(
            width: 375,
            child: _buildDefaultSingleDatePickerWithValue(),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: 300,
            child: _getDateDetail(),
          ),
        )
      ],
    );
  }

  Widget _getDateDetail() {
    return const DisplayList();
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
    var config = CalendarDatePicker2Config(
      selectedDayHighlightColor: Colors.pink,
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsHeight: 50,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
    );
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          CalendarDatePicker2(
            config: config,
            initialValue: ref.watch(selectedDateProvider),
            onValueChanged: (values) {
              print("hi");
              ref.watch(selectedDateProvider.notifier).state = values;
              ref.refresh(weeklyBazzarProvider);
              print(_singleDatePickerValueWithDefaultValue.toString());
            },
            selectableDayPredicate: (day) => !day
                .difference(DateTime.now().subtract(const Duration(days: 1)))
                .isNegative,
          ),
          const SizedBox(height: 0),
          Container(
            height: 2,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
