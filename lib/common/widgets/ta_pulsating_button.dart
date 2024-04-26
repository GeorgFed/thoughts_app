import 'dart:async';

import 'package:flutter/material.dart';

import 'ta_button.dart';

class TAPulsatingButton extends StatefulWidget {
  final String text;
  final void Function() onPressed;

  const TAPulsatingButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<TAPulsatingButton> createState() => _TAPulsatingButtonState();
}

class _TAPulsatingButtonState extends State<TAPulsatingButton> {
  bool _isPulsating = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
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
    return Stack(
      children: [
        Center(
          child: AnimatedContainer(
            height: 24,
            width: _isPulsating ? 44 : 64,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary,
                  spreadRadius: _isPulsating ? 24 : 44,
                  blurRadius: _isPulsating ? 24 : 44,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            duration: const Duration(seconds: 3),
            curve: Curves.easeInOut,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44.0),
          child: TAButton(
            text: widget.text,
            onPressed: widget.onPressed,
          ),
        ),
      ],
    );
  }
}
