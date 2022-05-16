import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/presentation/widgets/date_picker_field.dart';
import 'package:flutter_garden/src/presentation/widgets/name_field.dart';
import 'package:flutter_garden/src/presentation/widgets/plants_dropdown.dart';
import 'package:flutter_garden/src/presentation/widgets/save_plant_button.dart';

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
          SavePlantButton(onSave: onSave),
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
          NameField(plant: plant, onNameChange: onNameChange),
          const SizedBox(height: 30),
          PlantsDropDown(plant: plant, onTypeChange: onTypeChange),
          const SizedBox(height: 30),
          DatePickerField(plant: plant, onDateChange: onDateChange),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
