import 'package:flutter/material.dart';

import '../../common/image_getter.dart';
import '../../common/widgets/ta_tag.dart';

class MeditationListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;
  final List<String> tags;
  final String coverUrl;

  const MeditationListTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.tags,
    required this.coverUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.cardColor,
                image: DecorationImage(
                  // Apply color filter to darken image
                  colorFilter: const ColorFilter.mode(
                    Colors.black26,
                    BlendMode.darken,
                  ),
                  image: ImageGetter.image(coverUrl),
                ),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              subtitle,
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tags
                    .map(
                      (it) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TATag(
                          text: it,
                          size: TATagSize.small,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
