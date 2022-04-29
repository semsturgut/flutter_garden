import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

class AddOrEditPlantView extends StatelessWidget {
  final Plant? plant;
  final VoidCallback onSave;
  const AddOrEditPlantView({
    required this.onSave,
    this.plant,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Expanded(child: _Body()),
          _AddPlantButton(onSave: onSave),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          TextFormField(decoration: const InputDecoration(hintText: 'Name')),
          const SizedBox(height: 30),
          TextFormField(decoration: const InputDecoration(hintText: 'Type')),
          const SizedBox(height: 30),
          TextFormField(decoration: const InputDecoration(hintText: 'Date')),
          const SizedBox(height: 30),
        ],
      ),
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
