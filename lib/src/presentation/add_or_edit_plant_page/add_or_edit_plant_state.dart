import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_or_edit_plant_state.freezed.dart';

@freezed
class AddOrEditPlantState with _$AddOrEditPlantState {
  const factory AddOrEditPlantState.loading() = ShowLoading;

  const factory AddOrEditPlantState.showView() = ShowView;

  const factory AddOrEditPlantState.showError({String? message}) = ShowError;
}
