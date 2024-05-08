import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'onboarding_di.dart';
import 'onboarding_view_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => _OnboardingView(
          ref.watch(
            OnboardingDi.viewModel,
          ),
        ),
      );
}

class _OnboardingView extends StatefulWidget {
  final OnboardingViewModel viewModel;

  const _OnboardingView(this.viewModel);

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildPageIndicators() {
    var indicators = <Widget>[];
    for (var i = 0; i < 2; i++) {
      indicators.add(
        i == _currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return indicators;
  }

  Widget _indicator(bool isActive) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: isActive ? 12.0 : 12.0,
        width: isActive ? 12.0 : 12.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.white : Colors.grey.shade500,
        ),
      );

  void _nextPage() {
    if (_currentPage == 0) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/sign_up');
      widget.viewModel.onOnboardingShown();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildPage(
                image: 'assets/image/onboarding-1.jpg',
                title: 'Мысли глубже',
                text:
                    'Добро пожаловать в Мысли – ваш проводник в мир медитаций.  Путь к внутреннему покою начинается здесь.',
                theme: theme,
              ),
              _buildPage(
                image: 'assets/image/onboarding-2.jpg',
                title: 'Медитации для вас',
                text:
                    'Уникальные медитации, подобранные искусственным интеллектом под ваше состояние',
                theme: theme,
              ),
            ],
          ),
          Positioned(
            bottom: 96.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(256, 64.0),
                    ),
                  ),
                  child: Text(
                    _currentPage == 0 ? 'Далее' : 'Вход в систему',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicators(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String text,
    required ThemeData theme,
  }) =>
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 228.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  text,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
