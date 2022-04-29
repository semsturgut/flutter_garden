import 'package:flutter/material.dart';
import 'package:flutter_garden/src/core/extensions/date_time_extension.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

const Duration _animationSwitchDuration = Duration(milliseconds: 300);
const double _fabBottomPadding = 20;
const double _fabRightPadding = 30;

class PlantListView extends StatelessWidget {
  final List<Plant> plants;
  final Function(Plant) onItemTap;
  final VoidCallback onAddPlantTap;
  const PlantListView({
    required this.plants,
    required this.onItemTap,
    required this.onAddPlantTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          _Body(plants: plants, onItemTap: onItemTap),
          _AddPlantButton(onAddPlantTap: onAddPlantTap),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.plants,
    required this.onItemTap,
    Key? key,
  }) : super(key: key);

  final List<Plant> plants;
  final Function(Plant p1) onItemTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: _animationSwitchDuration,
      child: plants.isEmpty
          ? const _EmptyState()
          : _PlantList(
              plants: plants,
              onItemTap: onItemTap,
            ),
    );
  }
}

class _PlantList extends StatelessWidget {
  const _PlantList({
    required this.plants,
    required this.onItemTap,
    Key? key,
  }) : super(key: key);

  final List<Plant> plants;
  final Function(Plant p1) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plants.length,
      itemBuilder: (context, index) => ListTile(
        title: Text('Name:'+ plants[index].name),
        leading: Text(plants[index].shortName, style: const TextStyle(fontSize: 36)),
        subtitle: Text('Type:'+ plants[index].plantType.name.toUpperCase()),
        trailing: Text('Date:'+ plants[index].plantingDate.parseToDayMonthYear()),
        onTap: () => onItemTap(plants[index]),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Please add plants"));
  }
}

class _AddPlantButton extends StatelessWidget {
  final VoidCallback onAddPlantTap;
  const _AddPlantButton({
    required this.onAddPlantTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: _fabBottomPadding,
      right: _fabRightPadding,
      child: FloatingActionButton.extended(
        label: const Text("+ Add plant"),
        onPressed: onAddPlantTap,
      ),
    );
  }
}
