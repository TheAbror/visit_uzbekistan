import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class MoreTab extends StatefulWidget {
  const MoreTab({super.key});

  @override
  State<MoreTab> createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  final UserModel? hive = userBox.get(ShPrefKeys.userBox);

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
              profileCard(context, hive?.name ?? 'User'),
              SizedBox(height: 20.h),
              settingsList(context),
              LogoutButton(),
            ],
          ),
        ),
        CustomAppBar(
          title: context.localizations.more,
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
              title: context.localizations.contact,
              iconPath: 'assets/icons/user_plus.svg',
              onTap: () {
                // launchUrl(
                //   Uri.parse('https://t.me/healthguarduz_help'),
                //   mode: LaunchMode.externalApplication,
                // );
              },
            ),
            SettingRowItem(
              title: context.localizations.help,
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
              hideDivider: false,
            ),
            SettingRowItem(
              title: context.localizations.downloads,
              iconPath: 'assets/icons/pills_checked.svg',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.downloadsPage);
              },
              hideDivider: true,
            ),
          ],
        ),
      ),
    );
  }
}
