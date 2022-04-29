import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_list_state.freezed.dart';

@freezed
class PlantListState with _$PlantListState {
  const factory PlantListState.loading() = ShowLoading;

  const factory PlantListState.showView({required List<Plant> plants}) = ShowView;

  const factory PlantListState.goToEditPlant({Plant? plant}) = GoToEditPlant;

  const factory PlantListState.showError({String? message}) = ShowError;
}
