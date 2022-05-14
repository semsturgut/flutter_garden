import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_garden/src/core/extensions/date_time_extension.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

class AddOrEditPlantView extends StatelessWidget {
  final Plant? plant;
  final Function(String) onNameChange;
  final Function(PlantType) onTypeChange;
  final Function(DateTime) onDateChange;
  final VoidCallback onSave;
  const AddOrEditPlantView({
    required this.onNameChange,
    required this.onTypeChange,
    required this.onDateChange,
    required this.onSave,
    this.plant,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: _Body(
              onNameChange: onNameChange,
              onTypeChange: onTypeChange,
              onDateChange: onDateChange,
              plant: plant,
            ),
          ),
          _AddPlantButton(onSave: onSave),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Plant? plant;
  final Function(String) onNameChange;
  final Function(PlantType) onTypeChange;
  final Function(DateTime) onDateChange;
  const _Body({
    required this.onNameChange,
    required this.onTypeChange,
    required this.onDateChange,
    this.plant,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NameField(plant: plant, onNameChange: onNameChange),
          const SizedBox(height: 30),
          _PlantsDropDown(plant: plant, onTypeChange: onTypeChange),
          const SizedBox(height: 30),
          _DatePickerField(plant: plant, onDateChange: onDateChange),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.plant,
    required this.onNameChange,
    Key? key,
  }) : super(key: key);

  final Plant? plant;
  final Function(String p1) onNameChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: plant?.name,
      decoration: const InputDecoration(hintText: 'Plant Name'),
      onChanged: onNameChange,
    );
  }
}

class _PlantsDropDown extends StatelessWidget {
  const _PlantsDropDown({
    required this.plant,
    required this.onTypeChange,
    Key? key,
  }) : super(key: key);

  final Plant? plant;
  final Function(PlantType p1) onTypeChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Plant type:'),
        DropdownButton<PlantType>(
          value: plant?.plantType,
          items: PlantType.values.map((type) => _buildMenuItem(type)).toList(),
          onChanged: (item) {
            if (item != null) onTypeChange(item);
          },
        ),
      ],
    );
  }

  DropdownMenuItem<PlantType> _buildMenuItem(PlantType item) => DropdownMenuItem(
        value: item,
        child: Text(item.name.toUpperCase()),
      );
}

class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
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

class _AddPlantButton extends StatelessWidget {
  final VoidCallback onSave;
  const _AddPlantButton({
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      child: const Text("Save"),
      onPressed: onSave,
    );
  }
}
