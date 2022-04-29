import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/injection.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_cubit.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_mixin.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_state.dart';

class AddOrEditPlantPage extends StatelessWidget with AddOrEditPlantMixin implements AutoRouteWrapper {
  final Plant? plant;
  const AddOrEditPlantPage({this.plant, Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<AddOrEditPlantCubit>(
        create: (_) => getIt<AddOrEditPlantCubit>()..initialize(plant),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(plant != null ? "Update Plant" : "Add Plant")),
      body: BlocBuilder<AddOrEditPlantCubit, AddOrEditPlantState>(
        builder: (context, state) => builder(
          context,
          state,
          plant: plant,
        ),
      ),
    );
  }
}
