import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/domain/services/plants_service.dart';

import 'add_or_edit_plant_state.dart';

class AddOrEditPlantCubit extends Cubit<AddOrEditPlantState> {
  final PlantsService _plantsService;
  AddOrEditPlantCubit(this._plantsService) : super(const ShowLoading());

  late Plant _plant;

  Future<void> initialize(Plant? plant) async {
    _updateFieldsFromPlant(plant);
    _showView();
  }

  void onNameChange(String name) {
    _plant = _plant.copyWith(name: name);
    _showView();
  }

  void onTypeChange(PlantType plantType) {
    _plant = _plant.copyWith(plantType: plantType);
    _showView();
  }

  void onDateChange(DateTime plantDate) {
    _plant = _plant.copyWith(plantingDate: plantDate);
    _showView();
  }

  Future<void> onSave() async {
    try {
      _checkIfFieldsEmpty();
      await _plantsService.insertOrUpdatePlant(_plant);
      emit(PlantSaved(_plant));
    } catch (e) {
      emit(ShowError(e.toString()));
    }
    _showView();
  }

  void _updateFieldsFromPlant(Plant? plant) => _plant = plant ?? Plant.emptyPlant();

  void _showView() {
    emit(ShowView(plant: _plant));
  }

  void _checkIfFieldsEmpty() {
    if (_plant.name == "") throw "Please fill the name field.";
    if (_plant.name.length < 2) throw "Name should be at least 2 characters.";
    if (_plant.name.length > 10) throw "Name should be 10 characters maximum.";
  }
}
