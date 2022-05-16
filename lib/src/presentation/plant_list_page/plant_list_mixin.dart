import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_page.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_cubit.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_state.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_view.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_view_model.dart';
import 'package:flutter_garden/src/presentation/widgets/error_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

mixin PlantListMixin {
  bool buildWhen(PlantListState previous, PlantListState current) => current is! GoToEditPlant;

  bool listenWhen(PlantListState previous, PlantListState current) => current is! ShowView && current is! ShowError;

  void listener(BuildContext context, PlantListState state) {
    state.maybeMap(
      goToEditPlant: (state) => _launchEditPlantModal(context, state.plant),
      orElse: () {},
    );
  }

  Widget builder(
    BuildContext context,
    PlantListState state,
  ) {
    final cubit = BlocProvider.of<PlantListCubit>(context);
    return state.maybeMap(
      showView: (state) => PlantListView(
        plantListViewModel: PlantListViewModel(
          plants: state.plants,
          loadMorePlants: cubit.loadMorePlants,
          onItemTap: (plant) => cubit.editOrAddPlant(plant: plant),
          hasNextPage: state.hasNextPage,
          isLoadMoreRunning: state.isLoadMoreRunning,
          onSearchSubmitted: cubit.searchPlantName,
          loading: state.loading,
        ),
        onAddPlantTap: cubit.editOrAddPlant,
      ),
      showError: (state) => ErrorView(reloadCallback: () => cubit.initialize()),
      orElse: () => const SizedBox(),
    );
  }

  void _launchEditPlantModal(BuildContext context, Plant? plant) => showCupertinoModalBottomSheet<Plant>(
          context: context,
          builder: (BuildContext context) => AddOrEditPlantPage(plant: plant).wrappedRoute(context)).then(
        (plant) {
          if (plant != null) {
            BlocProvider.of<PlantListCubit>(context).updatePlants(plant);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(plant.name + " is saved.")));
          }
        },
      );
}
