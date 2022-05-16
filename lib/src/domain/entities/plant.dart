import 'package:floor/floor.dart';
import 'package:mocktail/mocktail.dart';

@entity
class Plant {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String shortName;
  final String name;
  final PlantType plantType;
  final DateTime plantingDate;

  Plant({
    required this.name,
    required this.plantType,
    required this.plantingDate,
    this.id,
  }) : shortName = name.length < 2 ? "" : (name[0] + name[name.length - 1]).toUpperCase();

  factory Plant.emptyPlant() => Plant(
        name: "",
        plantType: PlantType.alpines,
        plantingDate: DateTime.now(),
      );

  // instead of copyWith we can use equatable package.
  Plant copyWith({
    String? name,
    PlantType? plantType,
    DateTime? plantingDate,
  }) =>
      Plant(
        id: id,
        name: name ?? this.name,
        plantType: plantType ?? this.plantType,
        plantingDate: plantingDate ?? this.plantingDate,
      );
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


class FakePlant extends Fake implements Plant {}