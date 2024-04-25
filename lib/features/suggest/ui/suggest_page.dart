import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/ta_button.dart';
import '../../../common/widgets/ta_tag.dart';
import '../../../common/widgets/ta_text_field.dart';

class SuggestPage extends StatelessWidget {
  const SuggestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Подобрать медитацию'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline_rounded),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Text(
                              'Здесь можно ответить на несколько вопросов, чтобы получить рекомендацию для прослушивание'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'О чем вы думаете?',
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TATextField(
                      controller: TextEditingController(),
                      hint:
                          'Например: Я переживаю, хочу послушать что-то спокойное и умиротворенное...',
                      size: TATextFieldSize.large,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'Как вы себя чувствуете?',
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      'Радостно',
                      'Грустно',
                      'Скучно',
                      'Уныло',
                      'Энергично',
                      'Задумчиво',
                      'В работе',
                      'Сонно',
                    ]
                        .map(
                          (it) => TATag(
                            text: it,
                            size: TATagSize.large,
                            isSelected: false,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TAButton(
                text: 'Подобрать медитацию',
                onPressed: () => context.push('/playlist'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
