import 'package:flutter/material.dart';

// Horizontal Spacing
const Widget horizontalSpaceVeryTiny = SizedBox(width: 3.0);
const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceSmallPlus = SizedBox(width: 15.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceMediumPlus = SizedBox(width: 30.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);
const Widget horizontalSpaceXLarge = SizedBox(width: 80.0);

const Widget verticalSpaceVeryTiny = SizedBox(height: 3.0);
const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceSmallPlus = SizedBox(height: 15.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceMediumPlus = SizedBox(height: 30.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceXLarge = SizedBox(height: 80.0);

// Screen Size helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
