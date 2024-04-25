// TODO: Create a stateless widhet TAButton
import 'package:flutter/material.dart';

class TAButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const TAButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) => states.contains(MaterialState.disabled)
              ? theme.buttonTheme.colorScheme?.primaryContainer
              : theme.primaryColor,
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 72),
        ),
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(
        text,
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
