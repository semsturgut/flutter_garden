import 'package:flutter_garden/src/data/datasources/app_database.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/domain/repositories/plants_repository.dart';

class PlantsRepositoryImpl implements PlantsRepository {
  final AppDatabase _appDatabase;

  const PlantsRepositoryImpl(this._appDatabase);

  @override
  Future<List<Plant>> getSavedPlants(int offset) => _appDatabase.plantDao.findAllPlants(offset);

  @override
  Future<List<Plant>> findPlantsByName(String name) => _appDatabase.plantDao.findPlantsByName(name);

  @override
  Future<Plant?> findPlantById(int id)=> _appDatabase.plantDao.findPlantById(id);

  @override
  Future<void> insertPlant(Plant plant) => _appDatabase.plantDao.insertPlant(plant);

  @override
  Future<void> updatePlant(Plant plant) => _appDatabase.plantDao.updatePlant(plant);
}
