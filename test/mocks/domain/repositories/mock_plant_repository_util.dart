// import 'package:flutter_garden/src/domain/repositories/mock_plants_repository.dart';
import 'package:flutter_garden/src/domain/repositories/plants_repository.dart';
import 'package:flutter_garden/src/injection.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities/mock_plant.dart';

void prepareEmptyListOfPlantsFromDatabase() {
  final mockPlantsRepository = getIt<PlantsRepository>();
  when(
    () => mockPlantsRepository.getSavedPlants(any()),
  ).thenAnswer((_) async => []);
}

void prepareSinglePlantFromDatabase() {
  final mockPlantsRepository = getIt<PlantsRepository>();
  when(
    () => mockPlantsRepository.getSavedPlants(any()),
  ).thenAnswer((_) async => [mockPlant]);
}

void prepareListOfPlantsFromDatabase() {
  final mockPlantsRepository = getIt<PlantsRepository>();
  when(
    () => mockPlantsRepository.getSavedPlants(any()),
  ).thenAnswer((_) async => mockPlantList);
}

void preparefindPlantByIdReturnsNull() {
  final mockPlantsRepository = getIt<PlantsRepository>();
  when(
    () => mockPlantsRepository.findPlantById(any()),
  ).thenAnswer((_) async => mockPlant);
}

void prepareInsertPlantToDatabase() {
  final mockPlantsRepository = getIt<PlantsRepository>();
  when(
    () => mockPlantsRepository.insertPlant(any()),
  ).thenAnswer((_) async => {});
}

void prepareUpdatePlantToDatabase() {
  final mockPlantsRepository = getIt<PlantsRepository>();
  when(
    () => mockPlantsRepository.updatePlant(any()),
  ).thenAnswer((_) async => {});
}
