import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';
import 'package:personal_finance_management_app/ui/views/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
        builder: (context, model, child) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 6, 6, 15),
                child: Column(
                  children: [
                    _buildCard(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor: customTheme.avatarBackgroundColor,
                            child: Icon(
                              Icons.person_rounded,
                              color: customTheme.settingsIconColor,
                            ),
                          ),
                          title: const ThemeText.heading4(
                            "Guest User",
                          ),
                          trailing: IconButton(
                            iconSize: 28,
                            color: customTheme.actionButtonColor,
                            onPressed: () => model.navigateToProfile(),
                            icon: const Icon(Icons.chevron_right_rounded),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceVeryTiny,
                    _buildCard(
                      children: [
                        _buildListTile(
                          iconData: Icons.account_balance_rounded,
                          title: 'Accounts',
                          onPressed: model.navigateToAccountSettings,
                          theme: customTheme,
                        ),
                        _buildListTile(
                          iconData: Icons.category_rounded,
                          title: 'Categories',
                          onPressed: model.navigateToCategoryList,
                          theme: customTheme,
                        ),
                        _buildListTile(
                          iconData: Icons.notification_important_rounded,
                          title: 'Notifications',
                          onPressed: model.navigateToNotifications,
                          theme: customTheme,
                        ),
                      ],
                    ),
                    verticalSpaceVeryTiny,
                    _buildCard(
                      children: [
                        SwitchListTile(
                          title: const ThemeText.heading4(
                            'Dark Mode',
                          ),
                          secondary: SizedBox(
                            width: 44,
                            child: Icon(
                              Icons.dark_mode_rounded,
                              color: customTheme.settingsIconColor,
                            ),
                          ),
                          value: model.getIsThemeModeIsDark(),
                          onChanged: model.toggleTheme,
                          activeColor: customTheme.activeControlColor,
                          activeTrackColor: customTheme.activeSwitchTrackColor,
                        )
                      ],
                    ),
                    verticalSpaceVeryTiny,
                    _buildCard(
                      children: [
                        _buildListTile(
                          iconData: Icons.rate_review_rounded,
                          title: 'Feedback',
                          onPressed: () {},
                          theme: customTheme,
                        ),
                        _buildListTile(
                          iconData: Icons.info_rounded,
                          title: 'About',
                          onPressed: () => model.navigateToAbout(),
                          theme: customTheme,
                        ),
                      ],
                    ),
                  ],
                )),
          );
        });
  }

  ListTile _buildListTile({
    required CustomTheme theme,
    required IconData iconData,
    required String title,
    required void Function() onPressed,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      leading: SizedBox(
        width: 44,
        child: Icon(
          iconData,
          color: theme.settingsIconColor,
        ),
      ),
      title: ThemeText.heading4(title),
      trailing: IconButton(
        iconSize: 28,
        color: theme.actionButtonColor,
        onPressed: onPressed,
        icon: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }

  Card _buildCard({required List<Widget> children}) {
    return Card(
      child: Column(
        children: children,
      ),
    );
  }
}
