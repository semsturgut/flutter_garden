import 'package:flutter_garden/src/domain/entities/plant.dart';

abstract class PlantsService {
  Future<List<Plant>> getSavedPlants({int pageIndex = 0});

  Future<List<Plant>> findPlantsByName(String name);

  Future<void> insertOrUpdatePlant(Plant plant);
}
