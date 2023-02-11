import 'package:flutter/material.dart';

class ConditionalAsyncWrapper extends StatelessWidget {
  const ConditionalAsyncWrapper({
    Key? key,
    required this.isLoading,
    required this.child,
    this.showFallback = false,
    this.fallback,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;

  final bool showFallback;
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!isLoading && showFallback && fallback != null) {
      return fallback!;
    }

    return child;
  }
}
