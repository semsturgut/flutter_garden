import 'package:flutter_garden/src/domain/entities/plant.dart';

extension Capitalize on String {
  PlantType toPlantType() {
    if (isEmpty) return PlantType.alpines;
    return PlantType.values.map((type) => this == type.toString() ? type : PlantType.alpines).last;
  }
}
