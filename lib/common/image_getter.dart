import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_mode_provider.dart';

class ImageGetter {
  static ImageProvider image(String path) {
    if (AppModeProvider.isDemoMode) {
      return AssetImage(path);
    } else {
      return CachedNetworkImageProvider(path);
    }
  }
}
