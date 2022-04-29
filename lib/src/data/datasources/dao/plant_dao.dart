import 'package:floor/floor.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

const String _plantsTableName = 'Plant';

@dao
abstract class PlantDao {
  @Query('SELECT * FROM $_plantsTableName')
  Future<List<Plant>> findAllPlants();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPlant(Plant plant);
}