import 'package:flutter_garden/src/presentation/widgets/plant_list.dart';
import 'package:flutter_garden/src/presentation/widgets/plant_tile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/entities/mock_plant.dart';
import '../test_app_core/widget_bootstrap.dart';

void main() {
  testWidgets('Plant list widget test.', (WidgetTester tester) async {
    await tester.pumpWidget(
      WidgetBootstrap(
        body: PlantList(
          plantListViewModel: mockPlantListViewModelWithSinglePlant,
        ),
      ),
    );

    final plantTile = find.byType(PlantTile);
    final shortName = find.text('TT');

    expect(shortName, findsOneWidget);
    expect(plantTile, findsOneWidget);
  });
}
