import 'package:flutter_garden/src/domain/entities/plant.dart';

abstract class PlantsRepository {
  Future<List<Plant>> getSavedPlants(int offset);

  Future<List<Plant>> findPlantsByName(String name);

  Future<Plant?> findPlantById(int id);

  Future<void> insertPlant(Plant plant);

  Future<void> updatePlant(Plant plant);
}
