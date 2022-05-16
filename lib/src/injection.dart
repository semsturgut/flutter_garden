import 'package:flutter_garden/src/data/datasources/app_database.dart';
import 'package:flutter_garden/src/data/repositories/plants_repository_impl.dart';
import 'package:flutter_garden/src/data/services/plants_service_impl.dart';
import 'package:flutter_garden/src/domain/repositories/mock_plants_repository.dart';
import 'package:flutter_garden/src/domain/repositories/plants_repository.dart';
import 'package:flutter_garden/src/domain/services/plants_service.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_cubit.dart';
import 'package:get_it/get_it.dart';

import 'presentation/add_or_edit_plant_page/add_or_edit_plant_cubit.dart';

const String _databaseName = 'app_database.db';

final GetIt getIt = GetIt.instance;

Future<void> configureInjection({bool testing = false}) async {
  final database = await $FloorAppDatabase.databaseBuilder(_databaseName).build();
  getIt.registerSingleton<AppDatabase>(database);

  if (testing) {
    getIt.registerSingleton<PlantsRepository>(MockPlantsRepository());
  } else {
    getIt.registerSingleton<PlantsRepository>(
      PlantsRepositoryImpl(getIt()),
    );
  }

  getIt.registerSingleton<PlantsService>(
    PlantsServiceImpl(getIt()),
  );

  getIt.registerFactory<PlantListCubit>(
    () => PlantListCubit(getIt()),
  );

  getIt.registerFactory<AddOrEditPlantCubit>(
    () => AddOrEditPlantCubit(getIt()),
  );
}
