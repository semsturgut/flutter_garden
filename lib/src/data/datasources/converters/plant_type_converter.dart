import 'package:floor/floor.dart';
import 'package:flutter_garden/src/core/extensions/string_extensions.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

class PlantTypeConverter extends TypeConverter<PlantType, String> {
  @override
  PlantType decode(String databaseValue) {
    return databaseValue.toPlantType();
  }

  @override
  String encode(PlantType value) {
    return value.name;
  }
}

