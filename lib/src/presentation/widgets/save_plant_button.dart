import 'package:flutter/cupertino.dart';

class SavePlantButton extends StatelessWidget {
  final VoidCallback onSave;
  const SavePlantButton({
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: CupertinoButton.filled(
        child: const Text("Save"),
        onPressed: onSave,
      ),
    );
  }
}
