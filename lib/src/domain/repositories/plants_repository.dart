import 'package:flutter_garden/src/domain/entities/plant.dart';

abstract class PlantsRepository {
  Future<List<Plant>> getSavedPlants();

  Future<void> savePlant(Plant plant);
}
