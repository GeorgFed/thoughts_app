import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/ta_button.dart';
import '../../../../common/widgets/ta_text_field.dart';

class EnterNamePage extends StatefulWidget {
  const EnterNamePage({super.key});

  @override
  State<EnterNamePage> createState() => _EnterNamePageState();
}

class _EnterNamePageState extends State<EnterNamePage> {
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
              hint: 'Введите имя',
              controller: TextEditingController(),
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
              onPressed: () => context.go('/dashboard'),
            ),
          ),
        ],
      ),
    );
  }
}
