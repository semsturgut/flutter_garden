import 'package:floor/floor.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

const int plantsPageLimit = 10;
const String _plantsTableName = 'Plant';

@dao
abstract class PlantDao {
  @Query('SELECT * FROM $_plantsTableName LIMIT $plantsPageLimit OFFSET :offset')
  Future<List<Plant>> findAllPlants(int offset);

  @Query('SELECT * FROM $_plantsTableName WHERE name LIKE :name')
  Future<List<Plant>> findPlantsByName(String name);

  @Query('SELECT * FROM $_plantsTableName WHERE id = :id')
  Future<Plant?> findPlantById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPlant(Plant plant);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updatePlant(Plant plant);
}
