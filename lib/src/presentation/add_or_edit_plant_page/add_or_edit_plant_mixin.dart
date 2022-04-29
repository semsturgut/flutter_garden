import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_cubit.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_state.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_view.dart';
import 'package:flutter_garden/src/presentation/widgets/error_view.dart';

mixin AddOrEditPlantMixin {
  Widget builder(
    BuildContext context,
    AddOrEditPlantState state, {
    Plant? plant,
  }) {
    final cubit = BlocProvider.of<AddOrEditPlantCubit>(context);
    return state.maybeMap(
      showView: (state) => AddOrEditPlantView(onSave: cubit.onSave),
      showError: (state) => ErrorView(reloadCallback: () => cubit.initialize(plant)),
      orElse: () => const SizedBox(),
    );
  }
}
