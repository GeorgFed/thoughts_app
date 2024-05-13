import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/ta_button.dart';
import '../../../../common/widgets/ta_text_field.dart';
import '../auth_di.dart';
import '../auth_state.dart';
import '../auth_view_model.dart';

class EnterNamePage extends StatelessWidget {
  const EnterNamePage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocProvider.value(
          value: ref.watch(AuthDi.viewModel),
          child: const _EnterNameView(),
        ),
      );
}

class _EnterNameView extends StatefulWidget {
  const _EnterNameView();

  @override
  State<_EnterNameView> createState() => _EnterNameViewState();
}

class _EnterNameViewState extends State<_EnterNameView> {
  final enterNameController = TextEditingController();

  bool buttonEnabled = false;

  @override
  void initState() {
    super.initState();
    enterNameController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    enterNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: false,
      child: BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {
          if (state is AuthStateRegistrationComplete) {
            context.push('/dashboard');
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Регистрация',
                style: theme.textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 32.0,
                ),
                child: TATextField(
                  hint: 'Введите имя',
                  controller: enterNameController,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TAButton(
                  text: 'Зарегестрироваться',
                  onPressed: () => context.read<AuthViewModel>().enterName(
                        enterNameController.text,
                      ),
                  enabled: buttonEnabled,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateButtonState() => setState(
        () => buttonEnabled = enterNameController.text.isNotEmpty,
      );
}
