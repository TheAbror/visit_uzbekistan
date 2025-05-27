import 'package:visit_uzbekistan/widget_imports.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 124.h),
              profileCard(context),
              SizedBox(height: 20.h),
              settingsList(context),
              LogoutButton(),
            ],
          ),
        ),
        CustomAppBar(
          title: 'More',
          color: AppColors.primary,
          height: 56.h,
        ),
      ],
    );
  }

  Padding settingsList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      child: CardRounded18(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingRowItem(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return const LanguageBtmSheet();
                  },
                );
              },
              title: context.localizations.language,
              iconPath: 'assets/icons/global.svg',
            ),
            SettingRowItem(
              title: 'contact',
              iconPath: 'assets/icons/user_plus.svg',
              onTap: () {
                // launchUrl(
                //   Uri.parse('https://t.me/healthguarduz_help'),
                //   mode: LaunchMode.externalApplication,
                // );
              },
            ),
            SettingRowItem(
              title: 'help',
              iconPath: 'assets/icons/info_rect.svg',
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return const HelpBottomSheet();
                  },
                );
              },
              hideDivider: true,
            ),
          ],
        ),
      ),
    );
  }
}
