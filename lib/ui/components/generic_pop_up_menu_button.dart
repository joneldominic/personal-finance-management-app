import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/types/generic_pop_up_menu_item.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class GenericPopupMenuButton<T> extends StatelessWidget {
  final List<GenericPopupMenuItem<T>> items;
  final Function(T) onItemSelected;
  final String? tooltip;

  const GenericPopupMenuButton({
    Key? key,
    required this.items,
    required this.onItemSelected,
    this.tooltip = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return PopupMenuButton<T>(
      itemBuilder: (BuildContext context) {
        return items.map((GenericPopupMenuItem<T> item) {
          return PopupMenuItem<T>(
            value: item.value,
            child: Text(item.displayText),
          );
        }).toList();
      },
      onSelected: onItemSelected,
      tooltip: tooltip,
      icon: Icon(Icons.more_vert_rounded, color: customTheme.actionButtonColor),
      iconSize: 22,
    );
  }
}
