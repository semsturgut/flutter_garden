import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_list_state.freezed.dart';

@freezed
class PlantListState with _$PlantListState {
  const factory PlantListState.showView({
    required List<Plant> plants,
    required String searchFieldValue,
    @Default(true) bool loading,
    @Default(false) bool hasNextPage,
    @Default(false) bool isLoadMoreRunning,
  }) = ShowView;

  const factory PlantListState.goToEditPlant({Plant? plant}) = GoToEditPlant;

  const factory PlantListState.showError({String? message}) = ShowError;
}
