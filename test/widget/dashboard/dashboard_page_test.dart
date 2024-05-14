import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thoughts_app/features/dashboard/dashboard_page.dart';
import 'package:thoughts_app/features/dashboard/dashboard_view_model.dart';

import 'dashboard_page_test.mocks.dart';

@GenerateMocks([DashboardViewModel])
void main() {
  late MockDashboardViewModel mockDashboardViewModel;

  setUp(() {
    mockDashboardViewModel = MockDashboardViewModel();
    provideDummy<DashboardState>(DashboardStateIdle());
    when(mockDashboardViewModel.state).thenReturn(DashboardStateIdle());
  });

  Widget createWidgetUnderTest() => ProviderScope(
        child: MaterialApp(
          home: BlocProvider<DashboardViewModel>(
            create: (_) => mockDashboardViewModel,
            child: const DashboardPage(),
          ),
        ),
      );

  group('DashboardPage', () {
    testWidgets('shows loading indicator when state is loading',
        (tester) async {
      when(mockDashboardViewModel.state).thenReturn(DashboardStateLoading());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
