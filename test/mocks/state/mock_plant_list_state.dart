import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_state.dart';

import '../entities/mock_plant.dart';

const mockPlantListStateInitialShowView = PlantListState.showView(
  plants: [],
  searchFieldValue: "",
  loading: false,
  hasNextPage: true,
  isLoadMoreRunning: false,
);

final mockPlantListStateInitialShowViewWithPlants = PlantListState.showView(
  plants: mockPlantList,
  searchFieldValue: "",
  loading: false,
  hasNextPage: true,
  isLoadMoreRunning: false,
);

const mockPlantListStateGoToEditPlant = PlantListState.goToEditPlant();

final mockPlantListStateGoToEditPlantWithPlant = PlantListState.goToEditPlant(plant: mockPlant);

const mockPlantListStateShowError = PlantListState.showError();

const mockPlantListStateShowErrorWithMessage = PlantListState.showError(message: "Some error happened.");
