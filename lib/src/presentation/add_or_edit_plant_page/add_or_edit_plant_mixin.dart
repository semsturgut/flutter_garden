import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_cubit.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_state.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_view.dart';

mixin AddOrEditPlantMixin {
  bool buildWhen(AddOrEditPlantState previous, AddOrEditPlantState current) =>
      current is! ShowError && current is! PlantSaved;

  bool listenWhen(AddOrEditPlantState previous, AddOrEditPlantState current) => current is! ShowView;

  void listener(BuildContext context, AddOrEditPlantState state) {
    state.maybeMap(
      showError: (state) => _showErrorSnackBar(context, state.message),
      plantSaved: (state) => context.popRoute(state.plant),
      orElse: () {},
    );
  }

  Widget builder(
    BuildContext context,
    AddOrEditPlantState state, {
    Plant? plant,
  }) {
    final cubit = BlocProvider.of<AddOrEditPlantCubit>(context);
    return state.maybeMap(
      showView: (state) => AddOrEditPlantView(
        plant: state.plant,
        onNameChange: cubit.onNameChange,
        onTypeChange: cubit.onTypeChange,
        onDateChange: cubit.onDateChange,
        onSave: cubit.onSave,
      ),
      orElse: () => const SizedBox(),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
