import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_garden/src/core/extensions/date_time_extension.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
    required this.plant,
    required this.onDateChange,
    Key? key,
  }) : super(key: key);

  final Plant? plant;
  final Function(DateTime p1) onDateChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Planting Date:' + (plant?.plantingDate.parseToDayMonthYear() ?? DateTime.now().parseToDayMonthYear())),
        CupertinoButton(
          child: const Text('Pick a date'),
          onPressed: () {
            _showDatePicker(context).then((value) {
              if (value != null) onDateChange(value);
            });
          },
        ),
      ],
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }
}
