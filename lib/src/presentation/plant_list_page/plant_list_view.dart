import 'package:flutter/material.dart';
import 'package:flutter_garden/src/core/extensions/date_time_extension.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';

const Duration _animationSwitchDuration = Duration(milliseconds: 300);
const double _fabBottomPadding = 60;
const double _fabRightPadding = 30;

class PlantListViewModel {
  final List<Plant> plants;
  final Function(Plant plant) onItemTap;
  final Function() loadMorePlants;
  final bool hasNextPage;
  final bool isLoadMoreRunning;
  const PlantListViewModel({
    required this.plants,
    required this.onItemTap,
    required this.loadMorePlants,
    required this.isLoadMoreRunning,
    required this.hasNextPage,
  });
}

class PlantListView extends StatelessWidget {
  final PlantListViewModel plantListViewModel;
  final VoidCallback onAddPlantTap;
  const PlantListView({
    required this.plantListViewModel,
    required this.onAddPlantTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Body(plantListViewModel: plantListViewModel),
        _AddPlantButton(onAddPlantTap: onAddPlantTap),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final PlantListViewModel plantListViewModel;
  const _Body({
    required this.plantListViewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: _animationSwitchDuration,
      child:
          plantListViewModel.plants.isEmpty ? const _EmptyState() : _PlantList(plantListViewModel: plantListViewModel),
    );
  }
}

class _PlantList extends StatefulWidget {
  final PlantListViewModel plantListViewModel;
  const _PlantList({
    required this.plantListViewModel,
    Key? key,
  }) : super(key: key);

  @override
  State<_PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<_PlantList> {
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
          : ListTile(
              title: Text('Name:' + widget.plantListViewModel.plants[index].name),
              leading:
                  Text(widget.plantListViewModel.plants[index].shortName, style: const TextStyle(fontSize: 36)),
              subtitle: Text('Type:' + widget.plantListViewModel.plants[index].plantType.name.toUpperCase()),
              trailing:
                  Text('Date:' + widget.plantListViewModel.plants[index].plantingDate.parseToDayMonthYear()),
              onTap: () => widget.plantListViewModel.onItemTap(widget.plantListViewModel.plants[index]),
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
        child: Center(child: CircularProgressIndicator()),
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

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Please add plants"));
  }
}

class _AddPlantButton extends StatelessWidget {
  final VoidCallback onAddPlantTap;
  const _AddPlantButton({
    required this.onAddPlantTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: _fabBottomPadding,
      right: _fabRightPadding,
      child: FloatingActionButton.extended(
        label: const Text("+ Add plant"),
        onPressed: onAddPlantTap,
      ),
    );
  }
}
