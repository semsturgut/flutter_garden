import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_garden/src/data/datasources/converters/date_time_type_converter.dart';
import 'package:flutter_garden/src/data/datasources/converters/plant_type_converter.dart';
import 'package:flutter_garden/src/data/datasources/dao/plant_dao.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([PlantTypeConverter, DateTimeConverter])
@Database(version: 1, entities: [Plant])
abstract class AppDatabase extends FloorDatabase {
  PlantDao get plantDao;
}
