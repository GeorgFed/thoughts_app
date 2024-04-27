import 'dart:async';

import 'package:flutter/material.dart';

class TAPulsatingBlob extends StatefulWidget {
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final double minBlurRadius;
  final double maxBlurRadius;
  final Duration animationDuration;

  const TAPulsatingBlob({
    super.key,
    required this.minWidth,
    required this.maxWidth,
    required this.minHeight,
    required this.maxHeight,
    required this.minBlurRadius,
    required this.maxBlurRadius,
    required this.animationDuration,
  });

  @override
  State<TAPulsatingBlob> createState() => _TAPulsatingBlobState();
}

class _TAPulsatingBlobState extends State<TAPulsatingBlob> {
  bool _isPulsating = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.animationDuration, (timer) {
      setState(() {
        _isPulsating = !_isPulsating;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: AnimatedContainer(
        height: _isPulsating ? widget.minHeight : widget.maxHeight,
        width: _isPulsating ? widget.minWidth : widget.maxWidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary,
              spreadRadius:
                  _isPulsating ? widget.minBlurRadius : widget.maxBlurRadius,
              blurRadius:
                  _isPulsating ? widget.minBlurRadius : widget.maxBlurRadius,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        duration: widget.animationDuration,
        curve: Curves.easeInOut,
      ),
    );
  }
}
