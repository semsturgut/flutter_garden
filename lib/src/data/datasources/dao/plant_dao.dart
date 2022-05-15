import 'package:floor/floor.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

const int plantsPageLimit = 10;
const String _plantsTableName = 'Plant';
const String baseTable = "SELECT * FROM $_plantsTableName";

@dao
abstract class PlantDao {
  @Query("$baseTable LIMIT $plantsPageLimit OFFSET :offset")
  Future<List<Plant>> findAllPlants(int offset);

  @Query("$baseTable WHERE name LIKE :name")
  Future<List<Plant>> findPlantsByName(String name);

  @Query("$baseTable WHERE id = :id")
  Future<Plant?> findPlantById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPlant(Plant plant);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updatePlant(Plant plant);
}
