import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';

class CustomColorPicker extends StatelessWidget {
  const CustomColorPicker({
    Key? key,
    required this.value,
    required this.onPressed,
    required this.colorValueToTitleMap,
  }) : super(key: key);

  final void Function(String?) onPressed;
  final String? value;
  final Map<String, String> colorValueToTitleMap;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      key: key,
      value: value,
      menuMaxHeight: screenHeightPercentage(context, percentage: 0.30),
      borderRadius: BorderRadius.circular(5),
      decoration: const InputDecoration(
        label: Text("Color"),
      ),
      selectedItemBuilder: (context) => colorValueToTitleMap.keys.map<Widget>((value) {
        return Container(
          height: 30,
          width: screenWidth(context) - 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(
              int.parse(colorValueToTitleMap[value]!),
            ),
          ),
        );
      }).toList(),
      items: colorValueToTitleMap.keys
          .map(
            (value) => DropdownMenuItem<String>(
              key: ValueKey('$value key'),
              value: value,
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(
                    int.parse(colorValueToTitleMap[value]!),
                  ),
                ),
              ),
            ),
          )
          .toList(),
      onChanged: onPressed,
    );
  }
}
