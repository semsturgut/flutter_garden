import 'package:flutter/material.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_view_model.dart';
import 'package:flutter_garden/src/presentation/widgets/plant_tile.dart';

class PlantList extends StatefulWidget {
  final PlantListViewModel plantListViewModel;
  const PlantList({
    required this.plantListViewModel,
    Key? key,
  }) : super(key: key);

  @override
  State<PlantList> createState() => PlantListState();
}

class PlantListState extends State<PlantList> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController()..addListener(_paginationListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(_paginationListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.plantListViewModel.plants.length + 1,
      itemBuilder: (context, index) => (index == widget.plantListViewModel.plants.length)
          ? _lastItem()
          : PlantTile(
              plant: widget.plantListViewModel.plants[index],
              onItemTap: widget.plantListViewModel.onItemTap,
            ),
    );
  }

  void _paginationListener() {
    if (widget.plantListViewModel.isLoadMoreRunning == false &&
        widget.plantListViewModel.hasNextPage == true &&
        scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      widget.plantListViewModel.loadMorePlants();
    }
  }

  Widget _lastItem() {
    if (widget.plantListViewModel.isLoadMoreRunning == true) {
      return const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 40),
        child: Center(child: Text("Loading...")),
      );
    }
    if (widget.plantListViewModel.hasNextPage == false) {
      return const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 100),
        child: Center(child: Text('You have fetched all plants already.')),
      );
    }
    return const SizedBox(height: 40);
  }
}
