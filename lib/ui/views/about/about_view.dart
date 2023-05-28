import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/core/utils/text_style_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/about/about_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, child) {
        final appName = model.packageInfo?.appName ?? "Finance Buddy";
        final appVersion = model.packageInfo != null
            ? "${model.packageInfo!.version}+${model.packageInfo!.buildNumber}"
            : "0.0.0";

        return Scaffold(
          appBar: const CustomAppBar(
            title: Text("About"),
          ),
          backgroundColor: customTheme.contrastBackgroundColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                verticalSpaceMediumPlus,
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: customTheme.appBarBackgroundColor,
                    child: const Image(image: APP_LOGO_ASSET_IMAGE),
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  appName,
                  style: cardTitleStyle,
                ),
                verticalSpaceTiny,
                Text(
                  "Version $appVersion",
                  style: cardSubTitleStyle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
