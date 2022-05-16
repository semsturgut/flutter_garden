import 'package:flutter/material.dart';
import 'package:flutter_garden/src/core/main_router.gr.dart';
import 'package:flutter_garden/src/domain/entities/plant.dart';
import 'package:flutter_garden/src/injection.dart';
import 'package:flutter_garden/src/presentation/add_or_edit_plant_page/add_or_edit_plant_page.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_page.dart';
import 'package:flutter_garden/src/presentation/plant_list_page/plant_list_view.dart';
import 'package:flutter_garden/src/presentation/widgets/add_plant_button.dart';
import 'package:flutter_garden/src/presentation/widgets/name_field.dart';
import 'package:flutter_garden/src/presentation/widgets/plant_tile.dart';
import 'package:flutter_garden/src/presentation/widgets/save_plant_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/domain/repositories/mock_plant_repository_util.dart';
import '../mocks/entities/mock_plant.dart';
import '../test_app_core/test_bootstrap.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Plant list page', () {
    setUpAll(() {
      prepareFakes();
    });

    setUp(() async {
      await configureInjection(testing: true);
    });

    tearDown(() {
      getIt.reset();
    });

    testWidgets('Empty plant list, page should show appropriate message', (WidgetTester tester) async {
      prepareEmptyListOfPlantsFromDatabase();

      await _performEnterPlantListPageFlow(tester);

      expect(find.byType(PlantTile), findsNothing);
      expect(find.bySemanticsLabel("Please add plants"), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('Add Plant from AddOrEditPlantPage modal, go back to see if plant is added correctly.',
        (WidgetTester tester) async {
      prepareEmptyListOfPlantsFromDatabase();
      preparefindPlantByIdReturnsNull();
      prepareInsertPlantToDatabase();

      await _performEnterPlantListPageFlow(tester);

      final fabKey = find.byType(AddPlantButton);
      expect(fabKey, findsOneWidget);
      await tester.tap(fabKey);
      await tester.pumpAndSettle();
      expect(find.byType(AddOrEditPlantPage), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.bySemanticsLabel("Add Plant"), findsOneWidget);
      final nameField = find.byType(NameField);
      final plantsDropDownText = find.bySemanticsLabel("alpines".toUpperCase());

      expect(nameField, findsOneWidget);
      expect(plantsDropDownText, findsOneWidget);

      await tester.enterText(nameField, mockPlant.name);
      await tester.tap(plantsDropDownText);
      await tester.pumpAndSettle();
      final dropDownElement = find.bySemanticsLabel("aquatic".toUpperCase());
      expect(dropDownElement, findsOneWidget);
      await tester.tap(dropDownElement);
      await tester.pumpAndSettle();
      expect(dropDownElement, findsOneWidget);

      await tester.pumpAndSettle();

      final saveButton = find.byType(SavePlantButton);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();
      expect(find.byType(AddOrEditPlantPage), findsNothing);
      expect(find.byType(PlantTile), findsOneWidget);
      await tester.pump();
      final snackBar = find.byType(SnackBar);
      expect(snackBar, findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 4));
      expect(snackBar, findsNothing);
      final plantTile = find.byType(PlantTile);
      final shortName = find.text('TT');

      expect(shortName, findsOneWidget);
      expect(plantTile, findsOneWidget);
    });
  });
}

Future<void> _performEnterPlantListPageFlow(WidgetTester tester) async {
  await setIphoneXPhoneSize(tester);
  await tester.pumpWidget(bootStrapTest(const PlantListRoute()));
  await tester.pumpAndSettle();
  expect(find.byType(PlantListPage), findsOneWidget);
  expect(find.byType(PlantListView), findsOneWidget);
  await tester.pumpAndSettle();
}

void prepareFakes() {
  registerFallbackValue(FakePlant());
}
