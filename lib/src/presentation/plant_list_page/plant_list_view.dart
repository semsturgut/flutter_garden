import 'package:flutter/material.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_view_model.dart';
import 'package:flutter_garden/src/presentation/widgets/add_plant_button.dart';
import 'package:flutter_garden/src/presentation/widgets/empty_plant_state.dart';
import 'package:flutter_garden/src/presentation/widgets/plant_list.dart';
import 'package:flutter_garden/src/presentation/widgets/search_bar.dart';

const Duration _animationSwitchDuration = Duration(milliseconds: 300);

class PlantListView extends StatelessWidget {
  final PlantListViewModel plantListViewModel;
  final VoidCallback onAddPlantTap;
  const PlantListView({
    required this.plantListViewModel,
    required this.onAddPlantTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Body(plantListViewModel: plantListViewModel),
        AddPlantButton(onAddPlantTap: onAddPlantTap),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final PlantListViewModel plantListViewModel;
  const _Body({
    required this.plantListViewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(onSearchSubmitted: plantListViewModel.onSearchSubmitted),
        if (plantListViewModel.loading)
          const Center(child: Text("Loading..."))
        else
          Expanded(
            child: AnimatedSwitcher(
              duration: _animationSwitchDuration,
              child: plantListViewModel.plants.isEmpty
                  ? const EmptyState()
                  : PlantList(plantListViewModel: plantListViewModel),
            ),
          ),
      ],
    );
  }
}
