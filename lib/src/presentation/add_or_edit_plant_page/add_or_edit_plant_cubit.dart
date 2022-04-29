import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/domain/services/plants_service.dart';

import 'add_or_edit_plant_state.dart';

class AddOrEditPlantCubit extends Cubit<AddOrEditPlantState> {
  final PlantsService _plantsService;
  AddOrEditPlantCubit(this._plantsService) : super(const ShowLoading());

  // Plant? _plant;

  Future<void> initialize(Plant? plant) async {
    // _plant = plant;
    _showView();
  }

  Future<void> onSave() async {
    try {
      await _plantsService.savePlant(
        Plant(
          uniqueId: 1,
          name: "Sems123",
          plantType: PlantType.alpines,
          plantingDate: DateTime.now(),
        ),
      );
    } catch (_) {
      emit(const ShowError());
    }
    _showView();
  }

  void _showView() {
    emit(const ShowView());
  }
}
