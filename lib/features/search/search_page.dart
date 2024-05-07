import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/ta_text_field.dart';
import '../meditation/meditation_list_tile.dart';
import 'search_di.dart';
import 'search_view_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocProvider.value(
          value: ref.watch(SearchDi.viewModel)..onInit(),
          child: const _SearchView(),
        ),
      );
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchViewModel, SearchState>(
        builder: (context, state) => switch (state) {
          SearchStateIdle() => const SizedBox.shrink(),
          SearchStateNoResults() => const SizedBox.shrink(),
          SearchStateData(
            :final meditationItems,
          ) =>
            Scaffold(
              appBar: AppBar(
                title: TATextField(
                  onChanged: (query) =>
                      context.read<SearchViewModel>().onSearch(query),
                  hint: 'Поиск',
                  focusNode: _focusNode,
                ),
              ),
              body: Center(
                child: ListView.builder(
                  itemCount: meditationItems.length,
                  itemBuilder: (context, index) {
                    final item = meditationItems[index];
                    return MeditationListTile(
                      title: item.title,
                      subtitle: item.author,
                      coverUrl: item.coverUrl,
                      tags: item.tags,
                      onTap: () => context.push('/player/${item.id}'),
                    );
                  },
                ),
              ),
            ),
        },
      );
}
