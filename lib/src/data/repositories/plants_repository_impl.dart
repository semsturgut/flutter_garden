import 'package:flutter_garden/src/data/datasources/app_database.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/domain/repositories/plants_repository.dart';

class PlantsRepositoryImpl implements PlantsRepository {
  final AppDatabase _appDatabase;

  const PlantsRepositoryImpl(this._appDatabase);

  @override
  Future<List<Plant>> getSavedPlants() => _appDatabase.plantDao.findAllPlants();

  @override
  Future<void> savePlant(Plant plant) => _appDatabase.plantDao.insertPlant(plant);
}
