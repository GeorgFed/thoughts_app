import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TABanner extends StatelessWidget {
  final String title;
  final String text;
  final Widget? footer;
  final void Function()? onTap;

  const TABanner({
    super.key,
    required this.title,
    required this.text,
    this.onTap,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 128 + (footer == null ? 0 : 44),
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      text,
                      softWrap: true,
                      maxLines: 3,
                    ),
                    if (footer != null) ...[
                      const SizedBox(
                        height: 8,
                      ),
                      footer!,
                    ],
                  ],
                ),
              ),
            ),
            if (onTap != null)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CupertinoListTileChevron(),
              ),
          ],
        ),
      ),
    );
  }
}
