import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/text_style_helpers.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

enum ConstructorType {
  heading4,
  cardTitle,
  cardSubTitle,
  listItemTitle,
  listItemSubTitle,
}

class ThemeText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextAlign alignment;
  final ConstructorType constructorType;

  const ThemeText.heading4(
    this.text, {
    Key? key,
    this.color,
    this.alignment = TextAlign.start,
  })  : style = heading4Style,
        constructorType = ConstructorType.heading4,
        super(key: key);

  const ThemeText.cardTitle(
    this.text, {
    Key? key,
    this.color,
    this.alignment = TextAlign.start,
  })  : style = cardTitleStyle,
        constructorType = ConstructorType.cardTitle,
        super(key: key);

  const ThemeText.cardSubTitle(
    this.text, {
    Key? key,
    this.color,
    this.alignment = TextAlign.start,
  })  : style = cardSubTitleStyle,
        constructorType = ConstructorType.cardSubTitle,
        super(key: key);

  const ThemeText.listItemTitle(
    this.text, {
    Key? key,
    this.color,
    this.alignment = TextAlign.start,
  })  : style = listItemTitleStyle,
        constructorType = ConstructorType.listItemTitle,
        super(key: key);

  const ThemeText.listItemSubTitle(
    this.text, {
    Key? key,
    this.color,
    this.alignment = TextAlign.start,
  })  : style = listItemSubTitleStyle,
        constructorType = ConstructorType.listItemSubTitle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final TextStyle deferedStyle;

    switch (constructorType) {
      case ConstructorType.heading4:
        deferedStyle = color != null ? style.copyWith(color: color) : style;
        break;
      case ConstructorType.cardTitle:
        deferedStyle = color != null ? style.copyWith(color: color) : style;
        break;
      case ConstructorType.cardSubTitle:
        final finalColor = color ?? customTheme.subTitleColor;
        deferedStyle = style.copyWith(color: finalColor);
        break;
      case ConstructorType.listItemTitle:
        deferedStyle = color != null ? style.copyWith(color: color) : style;
        break;
      case ConstructorType.listItemSubTitle:
        final finalColor = color ?? customTheme.subTitleColor;
        deferedStyle = style.copyWith(color: finalColor);
        break;
    }

    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: deferedStyle,
      textAlign: alignment,
    );
  }
}
