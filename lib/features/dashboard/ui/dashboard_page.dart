import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/ta_banner.dart';
import '../../../common/widgets/ta_button.dart';
import '../../../common/widgets/ta_tag.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isPulsating = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _isPulsating = !_isPulsating;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(128),
        child: AppBar(
          toolbarHeight: 128,
          title: Padding(
            padding: const EdgeInsets.only(top: 44),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Привет, Егор',
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline_rounded),
                  onPressed: () => context.push('/profile'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TABanner(
                title: 'Вход в систему',
                text:
                    'Войдите или зарегестрируйтесь, чтобы у вас появился доступ ко всем возможностям приложения',
                onTap: () => context.push('/sign_up'),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  20,
                  (index) => Container(
                    margin: const EdgeInsets.all(8),
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () => context.go('/playlist'),
                child: Container(
                  height: 64,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Поиск',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Категории',
                    style: theme.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right_rounded),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Row(
                      children: List.generate(
                        20,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: TATag(
                            text: 'Тег $index',
                            onTap: () => context.go('/playlist'),
                            size: TATagSize.large,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: List.generate(
                        20,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: TATag(
                            text: 'Бооольшой Тег $index',
                            onTap: () => context.go('/playlist'),
                            size: TATagSize.large,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 128,
            ),
            Stack(
              children: [
                Center(
                  child: AnimatedContainer(
                    height: 24,
                    width: _isPulsating ? 44 : 64,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary,
                          spreadRadius: _isPulsating ? 24 : 44,
                          blurRadius: _isPulsating ? 24 : 44,
                          offset: const Offset(0, 16),
                        ),
                      ],
                    ),
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOut,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: TAButton(
                    text: 'Подобрать медитацию',
                    onPressed: () => context.go('/suggest'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
