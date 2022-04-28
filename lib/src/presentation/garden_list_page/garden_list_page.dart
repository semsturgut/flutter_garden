import 'package:flutter/material.dart';

class GardenListPage extends StatelessWidget {
  const GardenListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: const Text("Add plant +"),
        onPressed: () {},
      ),
    );
  }
}
