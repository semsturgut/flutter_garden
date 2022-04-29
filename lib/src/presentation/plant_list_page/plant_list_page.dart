import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_garden/src/injection.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_cubit.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_mixin.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_state.dart';

class PlantListPage extends StatelessWidget with PlantListMixin implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<PlantListCubit>(
        create: (_) => getIt<PlantListCubit>()..initialize(),
        child: this,
      );
  const PlantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Garden")),
      body: BlocConsumer<PlantListCubit, PlantListState>(
        buildWhen: buildWhen,
        listenWhen: listenWhen,
        builder: builder,
        listener: listener,
      ),
    );
  }
}
