import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/assets/custom_icons.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/core/utils/text_style_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';
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
                verticalSpaceMediumPlus,
                _buildAboutContent(model: model, customTheme: customTheme),
                verticalSpaceVeryTiny,
                _buildCard(
                  children: [
                    _buildListTile(
                      icon: Icon(
                        CustomIcons.github_square,
                        size: 23,
                        color: customTheme.primaryTextColor,
                      ),
                      title: 'Github Repository',
                      onPressed: () => model.onOpenGithubRepo(),
                      theme: customTheme,
                    ),
                    _buildListTile(
                      icon: const Icon(
                        CustomIcons.star,
                        size: 20,
                        color: Color(0xffffa500),
                      ),
                      title: 'Rate App',
                      onPressed: () => model.onRateApp(),
                      theme: customTheme,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextSpan _buildTextSpanLink({
    required String text,
    required Uri uri,
    required void Function() onTap,
  }) {
    return TextSpan(
      text: text,
      style: const TextStyle(color: Colors.blue),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }

  Widget _buildAboutContent({
    required AboutViewModel model,
    required CustomTheme customTheme,
  }) {
    final walletAppURI = Uri.parse("https://budgetbakers.com/");
    final splitwiseAppURI = Uri.parse("https://www.splitwise.com/");
    final bucketsAppURI = Uri.parse("https://www.budgetwithbuckets.com/");

    final style = TextStyle(color: customTheme.primaryTextColor);

    return _buildCard(
      children: [
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: [
              TextSpan(
                text: "An open-source, free budgeting app inspired by a popular apps, like ",
                style: style,
              ),
              _buildTextSpanLink(
                text: "Wallet",
                uri: walletAppURI,
                onTap: () => model.onTapLink(walletAppURI),
              ),
              TextSpan(
                text: ", ",
                style: style,
              ),
              _buildTextSpanLink(
                text: "Splitwise",
                uri: splitwiseAppURI,
                onTap: () => model.onTapLink(splitwiseAppURI),
              ),
              TextSpan(
                text: " and ",
                style: style,
              ),
              _buildTextSpanLink(
                text: "Buckets",
                uri: bucketsAppURI,
                onTap: () => model.onTapLink(bucketsAppURI),
              ),
              TextSpan(
                text:
                    ". Designed to provide an easy-to-use solution for managing personal finances. The app allows users to categorize expenses, set budgets, and track spending, as well as reach savings goals. With a user-friendly interface, this app is perfect for individuals looking to take control of their finances.",
                style: style,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

ListTile _buildListTile({
  required CustomTheme theme,
  required Icon icon,
  required String title,
  required void Function() onPressed,
}) {
  return ListTile(
    dense: true,
    minLeadingWidth: 30,
    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    leading: SizedBox(
      width: 40,
      child: icon,
    ),
    title: ThemeText.listItemTitle(title),
    trailing: IconButton(
      iconSize: 28,
      color: theme.actionButtonColor,
      onPressed: onPressed,
      icon: const Icon(Icons.chevron_right_rounded),
    ),
  );
}

Widget _buildCard({required List<Widget> children}) {
  return Card(
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: children,
      ),
    ),
  );
}
