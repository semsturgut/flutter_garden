import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_cubit.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_state.dart';

class MockPlantListCubit extends MockCubit<PlantListState> implements PlantListCubit {}
