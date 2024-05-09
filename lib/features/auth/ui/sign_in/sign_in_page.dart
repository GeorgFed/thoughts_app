import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/ta_button.dart';
import '../../../../common/widgets/ta_text_field.dart';
import '../auth_di.dart';
import '../auth_state.dart';
import '../auth_view_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocProvider.value(
          value: ref.watch(AuthDi.viewModel),
          child: const _SignInView(),
        ),
      );
}

class _SignInView extends StatefulWidget {
  const _SignInView();

  @override
  State<_SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<_SignInView> {
  var buttonEnabled = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<AuthViewModel, AuthState>(
      listener: (context, state) {
        if (state is AuthStateLoggedIn) {
          context.push('/dashboard');
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вход',
              style: theme.textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 32.0,
              ),
              child: TATextField(
                hint: 'Введите почту',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: TATextField(
                hint: 'Введите пароль',
                controller: passwordController,
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TAButton(
                text: 'Далее',
                onPressed: () => context.read<AuthViewModel>().onSignIn(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                enabled: buttonEnabled,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text('У меня еще нет аккаунта'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateButtonState() => setState(
        () => buttonEnabled = emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty,
      );
}
