import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/domain/services/plants_service.dart';

import 'plant_list_state.dart';

class PlantListCubit extends Cubit<PlantListState> {
  final PlantsService _plantsService;
  PlantListCubit(this._plantsService) : super(const ShowLoading());

  List<Plant> _plants = [];

  Future<void> initialize() async {
    await _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      _plants = await _plantsService.getSavedPlants();
      _showView();
    } catch (_) {
      emit(const ShowError());
    }
  }

  Future<void> onItemTap(Plant plant) async {
    try {} catch (_) {
      emit(const ShowError());
    }
    await _fetchData();
  }

  Future<void> onAddPlantTap() async {
    emit(const GoToEditPlant());
    _showView();
  }

  void _showView() {
    emit(ShowView(plants: _plants));
  }
}
