import 'package:flutter/material.dart';

const double _fabBottomPadding = 60;
const double _fabRightPadding = 30;
const addPlantFabKey = Key("addPlantFab");

class AddPlantButton extends StatelessWidget {
  final VoidCallback onAddPlantTap;
  const AddPlantButton({
    required this.onAddPlantTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: _fabBottomPadding,
      right: _fabRightPadding,
      child: FloatingActionButton.extended(
        key: addPlantFabKey,
        label: const Text("+ Add plant"),
        onPressed: onAddPlantTap,
      ),
    );
  }
}
