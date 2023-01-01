import 'package:flutter/material.dart';

class ConditionalAsyncWrapper extends StatelessWidget {
  const ConditionalAsyncWrapper({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : child;
  }
}
