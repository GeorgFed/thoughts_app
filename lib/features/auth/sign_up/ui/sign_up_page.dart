import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/ta_button.dart';
import '../../../../common/widgets/ta_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
              controller: TextEditingController(),
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
              controller: TextEditingController(),
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
              controller: TextEditingController(),
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
              onPressed: () => context.push('/enter_name'),
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
    );
  }
}
