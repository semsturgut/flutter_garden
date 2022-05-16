import 'package:flutter/material.dart';
import 'package:flutter_garden/src/core/extensions/date_time_extension.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

class PlantTile extends StatelessWidget {
  final Plant plant;
  final Function(Plant) onItemTap;
  const PlantTile({required this.plant, required this.onItemTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Name:' + plant.name),
      leading: Text(plant.shortName, style: const TextStyle(fontSize: 36)),
      subtitle: Text('Type:' + plant.plantType.name.toUpperCase()),
      trailing: Text('Date:' + plant.plantingDate.parseToDayMonthYear()),
      onTap: () => onItemTap(plant),
    );
  }
}
