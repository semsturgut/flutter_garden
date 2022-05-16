import 'package:flutter/material.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

class PlantsDropDown extends StatelessWidget {
  const PlantsDropDown({
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
