import 'package:flutter/material.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

class NameField extends StatelessWidget {
  const NameField({
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
