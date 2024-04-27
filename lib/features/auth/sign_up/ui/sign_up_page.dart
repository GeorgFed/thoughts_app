import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/ta_button.dart';
import '../../../../common/widgets/ta_text_field.dart';
import '../../auth_di.dart';
import '../../auth_state.dart';
import '../../auth_view_model.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocProvider.value(
          value: ref.watch(AuthDi.viewModel),
          child: const _SignUpView(),
        ),
      );
}

class _SignUpView extends StatefulWidget {
  const _SignUpView({super.key});

  @override
  State<_SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<_SignUpView> {
  var buttonEnabled = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
    confirmPasswordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AuthViewModel, AuthState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
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
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: TATextField(
                hint: 'Повторите пароль',
                controller: confirmPasswordController,
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
                onPressed: () {
                  context.read<AuthViewModel>().onSignUp(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                  context.push('/enter_name');
                },
                enabled: buttonEnabled,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () => context.push('/sign_in'),
              child: const Text('У меня уже есть аккаунт'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateButtonState() => setState(
        () => buttonEnabled = emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            confirmPasswordController.text == passwordController.text,
      );
}
