import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_garden/src/data/datasources/dao/plant_dao.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/domain/services/plants_service.dart';

import 'plant_list_state.dart';

class PlantListCubit extends Cubit<PlantListState> {
  final PlantsService _plantsService;
  PlantListCubit(this._plantsService)
      : super(const ShowView(
          plants: [],
          searchFieldValue: "",
          loading: true,
        ));

  List<Plant> _plants = [];
  late List<Plant> _filteredPlants;
  late String _searchFieldValue;
  late bool _hasNextPage;
  late bool _isLoadMoreRunning;

  int _pageIndex = 1;

  Future<void> initialize() async {
    await _loadInitialPlants();
  }

  void updatePlants(Plant plant) {
    final plantExist = _plants.any((element) => element.id == plant.id);
    if (plantExist) {
      _plants[_plants.indexWhere((element) => element.id == plant.id)] = plant;
    } else if (_plants.length < 10 || !_hasNextPage) {
      final latestId = _plants.isNotEmpty ? _plants.last.id! : 0;
      final newPlant = Plant(
        id: latestId + 1,
        name: plant.name,
        plantType: plant.plantType,
        plantingDate: plant.plantingDate,
      );
      _plants.add(newPlant);
    }
    if (!_isSearchFieldEmpty) {
      searchPlantName(_searchFieldValue);
      return;
    }
    _showView();
  }

  Future<void> loadMorePlants() async {
    if (!_isSearchFieldEmpty) return;
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

  Future<void> searchPlantName(String name) async {
    _searchFieldValue = name;
    try {
      _showView(loading: true);
      if (_isSearchFieldEmpty) {
        _showView();
        return;
      }
      _filteredPlants = await _plantsService.findPlantsByName(name);
      _showView(filteredPlants: _filteredPlants);
    } catch (_) {
      emit(const ShowError());
    }
  }

  void editOrAddPlant({Plant? plant}) {
    emit(GoToEditPlant(plant: plant));
    _isSearchFieldEmpty ? _showView() : _showView(filteredPlants: _filteredPlants);
  }

  Future<void> _loadInitialPlants() async {
    try {
      _filteredPlants = [];
      _searchFieldValue = "";
      _hasNextPage = true;
      _isLoadMoreRunning = false;
      _plants = await _plantsService.getSavedPlants();
      _showView();
    } catch (_) {
      emit(const ShowError());
    }
  }

  void _showView({bool loading = false, List<Plant>? filteredPlants}) {
    emit(ShowView(
      plants: List.from(filteredPlants ?? _plants),
      isLoadMoreRunning: _isLoadMoreRunning,
      hasNextPage: _hasNextPage,
      searchFieldValue: _searchFieldValue,
      loading: loading,
    ));
  }

  bool get _isSearchFieldEmpty => _searchFieldValue == "";
}
