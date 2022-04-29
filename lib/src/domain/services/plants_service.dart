import 'package:flutter_garden/src/domain/entities/plant.dart';

abstract class PlantsService {
  Future<List<Plant>> getSavedPlants();

  Future<void> savePlant(Plant plant);
}
