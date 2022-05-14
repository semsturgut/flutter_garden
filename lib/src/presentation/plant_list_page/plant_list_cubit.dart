import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_garden/src/data/datasources/dao/plant_dao.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/domain/services/plants_service.dart';

import 'plant_list_state.dart';

class PlantListCubit extends Cubit<PlantListState> {
  final PlantsService _plantsService;
  PlantListCubit(this._plantsService) : super(const ShowLoading());

  List<Plant> _plants = [];
  int _pageIndex = 1;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;

  Future<void> initialize() async {
    await _loadInitialPlants();
  }

  void updatePlants(Plant plant) {
    final plantExist = _plants.any((element) => element.id == plant.id);
    if (!_hasNextPage && !plantExist) {
      final newPlant = Plant(
        id: _plants.last.id! + 1,
        name: plant.name,
        plantType: plant.plantType,
        plantingDate: plant.plantingDate,
      );
      _plants.add(newPlant);
    } else if (plantExist) {
      _plants[_plants.indexWhere((element) => element.id == plant.id)] = plant;
    }
    _showView();
  }

  Future<void> loadMorePlants() async {
    try {
      _isLoadMoreRunning = true;
      _showView();
      final newPlants = await _plantsService.getSavedPlants(pageIndex: _pageIndex);
      _plants.addAll(newPlants);
      if (newPlants.length < plantsPageLimit) _hasNextPage = false;
      _pageIndex++;
      _isLoadMoreRunning = false;
      _showView();
    } catch (_) {
      emit(const ShowError());
    }
  }

  Future<void> editOrAddPlant({Plant? plant}) async {
    emit(GoToEditPlant(plant: plant));
    _showView();
  }

  Future<void> _loadInitialPlants() async {
    try {
      _plants = await _plantsService.getSavedPlants();
      _showView();
    } catch (_) {
      emit(const ShowError());
    }
  }

  void _showView() {
    emit(ShowView(
      plants: List.from(_plants),
      isLoadMoreRunning: _isLoadMoreRunning,
      hasNextPage: _hasNextPage,
    ));
  }
}
