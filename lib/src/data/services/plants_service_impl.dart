import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/domain/repositories/plants_repository.dart';
import 'package:flutter_garden/src/domain/services/plants_service.dart';

class PlantsServiceImpl implements PlantsService {
  final PlantsRepository _plantsRepository;

  const PlantsServiceImpl(this._plantsRepository);

  @override
  Future<List<Plant>> getSavedPlants() => _plantsRepository.getSavedPlants();

  @override
  Future<void> savePlant(Plant plant) => _plantsRepository.savePlant(plant);
}
