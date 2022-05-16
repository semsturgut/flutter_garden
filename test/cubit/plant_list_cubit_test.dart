import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_garden/src/injection.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_cubit.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/cubit/mock_plant_list_cubit.dart';
import '../mocks/state/mock_plant_list_state.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Plant list page', () {
    setUpAll(() {});

    setUp(() async {
      await configureInjection();
    });

    tearDown(() {
      getIt.reset();
    });

    test("Firing all states in order. Expecting states in the same order.", () {
      final cubit = MockPlantListCubit();
      whenListen(
          cubit,
          Stream.fromIterable(
              [mockPlantListStateInitialShowView, mockPlantListStateGoToEditPlant, mockPlantListStateShowError]));
      expectLater(
          cubit.stream,
          emitsInOrder(<PlantListState>[
            mockPlantListStateInitialShowView,
            mockPlantListStateGoToEditPlant,
            mockPlantListStateShowError
          ]));
    });

    blocTest<PlantListCubit, PlantListState>(
      "Triggering PlantListCubit initiliaze function, ShowView with plants: [], searchFieldValue: '', loading: false, hasNextPage: true, isLoadMoreRunning: false expected",
      build: () => PlantListCubit(getIt()),
      act: (cubit) => cubit.initialize(),
      expect: () => [mockPlantListStateInitialShowView],
    );
  });
}
