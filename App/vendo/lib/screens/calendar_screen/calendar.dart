import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'DisplayList.dart';

var today = DateUtils.dateOnly(DateTime.now());
var fetchedDate = DateUtils.dateOnly(DateTime.now()).toString();

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

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
        const SizedBox(height: 25),
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

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    return valueText;
  }

  Widget _getDateDetail() {
    return const DisplayList();
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
    var config = CalendarDatePicker2Config(
      selectedDayHighlightColor: Colors.amber[900],
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
        color: Colors.amber,
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
          //const Text('Single Date Picker (With default value)'),
          CalendarDatePicker2(
            config: config,
            initialValue: _singleDatePickerValueWithDefaultValue,
            onValueChanged: (values) =>
                setState(() => _singleDatePickerValueWithDefaultValue = values),
            selectableDayPredicate: (day) => !day
                .difference(DateTime.now().subtract(const Duration(days: 3)))
                .isNegative,
          ),
          const SizedBox(height: 10),

          Container(
            height: 2,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     const Text('Selection(s):  '),
          //     const SizedBox(width: 10),
          //     Text(
          //       _getValueText(
          //         config.calendarType,
          //         _singleDatePickerValueWithDefaultValue,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
