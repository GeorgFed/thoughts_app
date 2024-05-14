import 'package:flutter/material.dart';

class TAButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final bool isLoading;

  const TAButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
  });

  @override
  State<TAButton> createState() => _TAButtonState();
}

class _TAButtonState extends State<TAButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaleTransition(
      scale: _scaleAnimation,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.disabled)
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
        onPressed: widget.enabled && !widget.isLoading
            ? () async {
                await _animationController.forward(from: 0.0);
                await _animationController.reverse();
                widget.onPressed();
              }
            : null,
        child: widget.isLoading
            ? SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.onPrimary,
                  ),
                ),
              )
            : Text(
                widget.text,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
      ),
    );
  }
}
