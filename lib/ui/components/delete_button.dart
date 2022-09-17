import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) - 30,
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 18),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
