import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thoughts_app/features/player/player_page.dart';
import 'package:thoughts_app/features/player/player_view_model.dart';

import 'player_page_test.mocks.dart';

void provideDummies() {
  provideDummy<PlayerPageState>(PlayerStateIdle());
}

@GenerateMocks([PlayerViewModel])
void main() {
  provideDummies();

  late MockPlayerViewModel mockPlayerViewModel;

  setUp(() {
    mockPlayerViewModel = MockPlayerViewModel();
    when(mockPlayerViewModel.state).thenReturn(PlayerStateIdle());
  });

  Widget createWidgetUnderTest(String trackId) => ProviderScope(
        child: MaterialApp(
          home: BlocProvider<PlayerViewModel>(
            create: (_) => mockPlayerViewModel,
            child: PlayerPage(trackId: trackId),
          ),
        ),
      );

  group('PlayerPage', () {
    testWidgets('shows loading indicator when state is loading',
        (tester) async {
      when(mockPlayerViewModel.state).thenReturn(PlayerStateIdle());

      await tester.pumpWidget(createWidgetUnderTest('1'));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('shows error message when state is error', (tester) async {
      when(mockPlayerViewModel.state).thenReturn(PlayerStateNotFound());

      await tester.pumpWidget(createWidgetUnderTest('1'));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
