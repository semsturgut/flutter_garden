import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_page.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_cubit.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_state.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_view.dart';
import 'package:flutter_garden/src/presentation/widgets/error_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

mixin PlantListMixin {
  bool buildWhen(PlantListState previous, PlantListState current) => current is! GoToEditPlant;

  bool listenWhen(PlantListState previous, PlantListState current) => current is! ShowView && current is! ShowError;

  void listener(BuildContext context, PlantListState state) {
    state.maybeMap(
      goToEditPlant: (state) => _launchEditPlantModal(context),
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
        plants: state.plants,
        onItemTap: cubit.onItemTap,
        onAddPlantTap: cubit.onAddPlantTap,
      ),
      showError: (state) => ErrorView(reloadCallback: () => cubit.initialize()),
      orElse: () => const SizedBox(),
    );
  }

  void _launchEditPlantModal(BuildContext context) => showCupertinoModalBottomSheet<void>(
      context: context, builder: (BuildContext context) => const AddOrEditPlantPage().wrappedRoute(context));
}
