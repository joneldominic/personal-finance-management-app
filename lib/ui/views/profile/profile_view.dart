import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/core/utils/text_style_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ViewModelBuilder<ProfileViewModel>.nonReactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: const CustomAppBar(
          title: Text("User Profile"),
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
                  child: const Icon(
                    Icons.person_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              verticalSpaceSmall,
              const Text(
                "Guest User",
                style: cardTitleStyle,
              ),
              verticalSpaceLarge,
              _buildGoogleSignInButton(onPressed: () => model.handleSignInGoogle())
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton({
    required void Function() onPressed,
  }) {
    return OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: GOOGLE_LOGO_ASSET_IMAGE,
              height: 22.0,
            ),
            horizontalSpaceSmall,
            Text(
              "Sign in with Google",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ],
        ));
  }
}
