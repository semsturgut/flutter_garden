import 'package:auto_route/auto_route.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_page.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    MaterialRoute(page: PlantListPage, initial: true),
    MaterialRoute(page: AddOrEditPlantPage),
  ],
)
class $MainRouter {}
