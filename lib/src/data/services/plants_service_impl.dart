import 'package:flutter_garden/src/data/datasources/dao/plant_dao.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/domain/repositories/plants_repository.dart';
import 'package:flutter_garden/src/domain/services/plants_service.dart';

class PlantsServiceImpl implements PlantsService {
  final PlantsRepository _plantsRepository;

  const PlantsServiceImpl(this._plantsRepository);

  @override
  Future<List<Plant>> getSavedPlants({int pageIndex = 0}) async =>
      _plantsRepository.getSavedPlants(pageIndex * plantsPageLimit);

  @override
  Future<List<Plant>> findPlantsByName(String name) => _plantsRepository.findPlantsByName('%' + name + '%');

  @override
  Future<void> insertOrUpdatePlant(Plant plant) async {
    final isPlantExist = await _isPlantExist(plant.id);
    if (isPlantExist) {
      await _plantsRepository.updatePlant(plant);
    } else {
      await _plantsRepository.insertPlant(plant);
    }
  }

  Future<bool> _isPlantExist(int? plantId) async {
    if (plantId == null) return false;
    return await _plantsRepository.findPlantById(plantId) != null;
  }
}
