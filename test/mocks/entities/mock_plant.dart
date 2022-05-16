import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_view_model.dart';

final mockPlant = Plant(
  name: "test",
  plantType: PlantType.aquatic,
  plantingDate: DateTime(2017, 9, 7),
  id: 1,
);

final mockPlantList = [
  Plant(
    name: "test1",
    plantType: PlantType.aquatic,
    plantingDate: DateTime(2017, 9, 8),
    id: 1,
  ),
  Plant(
    name: "test2",
    plantType: PlantType.bulbs,
    plantingDate: DateTime(2017, 9, 9),
    id: 2,
  ),
  Plant(
    name: "test3",
    plantType: PlantType.carnivorous,
    plantingDate: DateTime(2017, 9, 10),
    id: 3,
  ),
];

final mockPlantListViewModelWithSinglePlant = PlantListViewModel(
  plants: [mockPlant],
  onItemTap: (_) {},
  loadMorePlants: () {},
  isLoadMoreRunning: false,
  hasNextPage: false,
  onSearchSubmitted: (_) {},
);

final mockPlantListViewModelWithMultiplePlants = PlantListViewModel(
  plants: mockPlantList,
  onItemTap: (_) {},
  loadMorePlants: () {},
  isLoadMoreRunning: false,
  hasNextPage: false,
  onSearchSubmitted: (_) {},
);

List<Plant> mockGeneratePlantList({int size = 10}) {
  final List<Plant> generatedPlantList = [];
  for (var index = 1; index < size + 1; index++) {
    generatedPlantList.add(Plant(
      name: "test" + index.toString(),
      plantType: PlantType.values[size ~/ index],
      plantingDate: DateTime(2017, 9, 7).add(Duration(days: index * 10)),
    ));
  }
  return generatedPlantList;
}
