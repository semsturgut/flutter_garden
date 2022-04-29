import 'package:floor/floor.dart';

@entity
class Plant {
  @primaryKey
  late String shortName;
  final int uniqueId;
  final String name;
  final PlantType plantType;
  final DateTime plantingDate;

  Plant({
    required this.uniqueId,
    required this.name,
    required this.plantType,
    required this.plantingDate,
  }) : shortName = (name[0] + name[name.length - 1]).toUpperCase();
}

enum PlantType {
  alpines,
  aquatic,
  bulbs,
  succulents,
  carnivorous,
  climbers,
  ferns,
  grasses,
  trees,
}
