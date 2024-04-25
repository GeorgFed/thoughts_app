import 'package:flutter/material.dart';

enum TATagSize {
  small,
  medium,
  large,
}

class TATag extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final TATagSize size;
  final Color? color;
  final bool? isSelected;

  const TATag({
    super.key,
    required this.text,
    this.size = TATagSize.medium,
    this.onTap,
    this.isSelected,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2 * sizeIndex),
        decoration: BoxDecoration(
          color: isSelected == true
              ? theme.primaryColor
              : isSelected == false
                  ? theme.cardColor.withAlpha(150)
                  : color ?? theme.cardColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8 * sizeIndex,
            horizontal: 16 * sizeIndex,
          ),
          child: Text(
            text,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: isSelected == true ? theme.colorScheme.onPrimary : null,
            ),
          ),
        ),
      ),
    );
  }

  double get sizeIndex => size == TATagSize.small
      ? 0.5
      : size == TATagSize.medium
          ? 1
          : 1.5;
}
