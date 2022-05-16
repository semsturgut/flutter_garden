import 'package:flutter_garden/src/domain/entities/plant.dart';

class PlantListViewModel {
  final List<Plant> plants;
  final Function(Plant) onItemTap;
  final Function() loadMorePlants;
  final bool hasNextPage;
  final bool isLoadMoreRunning;
  final Function(String) onSearchSubmitted;
  final bool loading;
  const PlantListViewModel({
    required this.plants,
    required this.onItemTap,
    required this.loadMorePlants,
    required this.isLoadMoreRunning,
    required this.hasNextPage,
    required this.onSearchSubmitted,
    this.loading = false,
  });
}
