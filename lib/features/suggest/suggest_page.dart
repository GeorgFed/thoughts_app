import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/ta_button.dart';
import '../../common/widgets/ta_tag.dart';
import '../../common/widgets/ta_text_field.dart';
import 'suggest_di.dart';
import 'suggest_view_model.dart';

class SuggestPage extends StatelessWidget {
  const SuggestPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocProvider.value(
          value: ref.watch(SuggestDi.viewModel),
          child: const _SuggestView(),
        ),
      );
}

class _SuggestView extends StatefulWidget {
  const _SuggestView();

  @override
  State<_SuggestView> createState() => _SuggestViewState();
}

class _SuggestViewState extends State<_SuggestView> {
  final _selectableItems = [
    _SelectableItem(title: 'Радостно'),
    _SelectableItem(title: 'Грустно'),
    _SelectableItem(title: 'Скучно'),
    _SelectableItem(title: 'Уныло'),
    _SelectableItem(title: 'Энергично'),
    _SelectableItem(title: 'Задумчиво'),
    _SelectableItem(title: 'В работе'),
    _SelectableItem(title: 'Сонно'),
  ];

  final textController = TextEditingController();

  var buttonEnabled = false;

  @override
  void initState() {
    super.initState();
    textController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<SuggestViewModel, SuggestState>(
      listener: (context, state) {
        if (state is SuggestStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        if (state is SuggestStateResult) {
          context.push('/suggest_result');
        }
      },
      builder: (context, state) => Scaffold(
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
                              'Здесь можно ответить на несколько вопросов, чтобы получить рекомендацию для прослушивание',
                            ),
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
                        controller: textController,
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
                      children: _selectableItems
                          .asMap()
                          .entries
                          .map(
                            (it) => TATag(
                              text: it.value.title,
                              isSelected: it.value.isSelected,
                              onTap: state is SuggestStateLoading
                                  ? null
                                  : () {
                                      setState(
                                        () {
                                          _selectableItems[it.key] =
                                              it.value.copyWith(
                                            isSelected: !it.value.isSelected,
                                          );
                                          buttonEnabled =
                                              textController.text.isNotEmpty &&
                                                  _selectableItems.any(
                                                    (it) => it.isSelected,
                                                  );
                                        },
                                      );
                                    },
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 44,
                ),
                child: TAButton(
                  text: 'Подобрать медитацию',
                  onPressed: () =>
                      context.read<SuggestViewModel>().onSuggestButtonTap(
                            textController.text,
                            _selectableItems
                                .where((it) => it.isSelected)
                                .map((it) => it.title)
                                .toList(),
                          ),
                  enabled: buttonEnabled,
                  isLoading: state is SuggestStateLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateButtonState() => setState(
        () => buttonEnabled = textController.text.isNotEmpty &&
            _selectableItems.any(
              (it) => it.isSelected,
            ),
      );
}

class _SelectableItem {
  final String title;
  final bool isSelected;

  _SelectableItem({
    required this.title,
    this.isSelected = false,
  });

  _SelectableItem copyWith({
    String? title,
    bool? isSelected,
  }) =>
      _SelectableItem(
        title: title ?? this.title,
        isSelected: isSelected ?? this.isSelected,
      );
}
