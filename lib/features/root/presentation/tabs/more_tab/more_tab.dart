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
              // docsAndPillsRow(context),
              // const SizedBox(height: 20),
              // pointsCard(),
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
                // showModalBottomSheet(
                //   backgroundColor: Colors.transparent,
                //   context: context,
                //   builder: (context) {
                //     return const LanguageBtmSheet();
                //   },
                // );
              },
              title: 'language',
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
              onTap: () {},
              hideDivider: true,
            ),
            // SettingRowItem(
            //   title: 'recommended apps',
            //   iconPath: 'assets/icons/info_rect.svg',
            //   onTap: () {
            //     // Navigator.of(context).pushNamed(RecommendedAppPage.routeName);
            //   },
            //   hideDivider: true,
            // ),
          ],
        ),
      ),
    );
  }

  Padding pointsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CardRounded16(
        height: 93.h,
        width: double.infinity,
        color: const Color(0xFF05BAD1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                'pointsCardTitle',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Padding docsAndPillsRow(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20.w),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         SettingsDocsAndPillsIRowtem(
  //           onTap: () {
  //             // Navigator.of(context).pushNamed(DocumentsListPage.routeName);
  //           },
  //           svgPath: 'assets/icons/medical_record.svg',
  //           svgText: 'medical_docs_short',
  //         ),
  //         SizedBox(width: 8.w),
  //         SettingsDocsAndPillsIRowtem(
  //           onTap: () {
  //             // Navigator.of(context).pushNamed(PillsConsumptionPage.routeName);
  //           },
  //           svgPath: 'assets/icons/pharmacy_icon.svg',
  //           svgText: 'pillsConsumption',
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget onErrorProfileWidget(ctx, _, s) => Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(28.r),
        ),
        alignment: Alignment.center,
        child: Text(
          'errorWhileLoading',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 7.sp,
            color: Colors.white,
          ),
        ),
      );

  CardRounded18 profileCard(BuildContext context) {
    // final fullName = HiveHelperUser.getFullName();
    // final profileImageUrl = HiveHelperUser.getProfileImage();
    // final profileImageLocal = HiveHelperUser.getProfileImageLocal();
    // final fullNameShorted =
    //     fullName.length > 12 ? '${fullName.substring(0, 12)}...' : fullName;

    // final fullNameText =
    //     fullNameShorted.isNotEmpty ? fullNameShorted : 'fillProfileTitle';

    return CardRounded18(
      height: 64.h,
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),
              // child: profileImageUrl != null
              //     ? Image.network(
              //         profileImageUrl,
              //         fit: BoxFit.cover,
              //         errorBuilder: profileImageLocal != null
              //             ? (ctx, _, __) {
              //                 return Image.memory(
              //                   profileImageLocal,
              //                   fit: BoxFit.cover,
              //                   errorBuilder: onErrorProfileWidget,
              //                 );
              //               }
              //             : onErrorProfileWidget,
              //       )
              // : 'profileImageLocal' != null
              //     ? Image.memory(
              //         'profileImageLocal',
              //         fit: BoxFit.cover,
              //         errorBuilder: onErrorProfileWidget,
              //       )
              child: Image.asset('assets/images/male_avatar_placeholder.png'),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'fullNameText',
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorDarkBlue,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).pushNamed(ProfileUpdatePage.routeName);
            },
            child: const IconContainer(iconPath: 'assets/icons/edit.svg'),
          ),
        ],
      ),
    );
  }

  void handleLogOut(context) async {
    // await HiveHelperUser.clear();
    // await HiveHelperPills.clear();
    // Navigator.of(context).pushNamedAndRemoveUntil(
    //   SignInPage.routeName,
    //   (Route<dynamic> route) => false,
    // );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: GestureDetector(
        onTap: () {
          signOutDialog(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(IconsaxPlusLinear.logout_1),
            SizedBox(width: 8.w),
            Text('Logout'),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> signOutDialog(BuildContext context) {
  return showPlatformDialog(
    context: context,
    builder: (myContext) => Theme(
      data: ThemeData(
          dialogBackgroundColor: Theme.of(context).colorScheme.background),
      child: BasicDialogAlert(
        title: Text('Sign out'),
        content: Text('Do you really want to sign out'),
        actions: <Widget>[
          BasicDialogAction(
            title: Text(
              'Yes',
              style: const TextStyle(color: AppColors.primary),
            ),
            onPressed: () async {
              GoogleSignInApi.logout();

              // HiveHelperUser.googleSignInBox.clear();

              debugPrint('Clearing finished');

              Navigator.of(context)
                  .pushReplacementNamed(OnboardingPage.routeName);
            },
          ),
          BasicDialogAction(
            title: Text(
              'No',
              style: const TextStyle(color: AppColors.primary),
            ),
            onPressed: () => Navigator.pop(myContext),
          ),
        ],
      ),
    ),
  );
}

class CardRounded18 extends StatelessWidget {
  const CardRounded18({
    super.key,
    required this.child,
    this.padding,
    this.height,
    this.border,
  });

  final Widget child;
  final double? height;
  final EdgeInsets? padding;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: padding ?? const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: border,
      ),
      child: child,
    );
  }
}

class SettingRowItem extends StatelessWidget {
  const SettingRowItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.hideDivider,
    this.onTap,
  });
  final String title;
  final String iconPath;
  final bool? hideDivider;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              IconContainer(iconPath: iconPath),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textColorDarkBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.chevron_right_rounded,
                  size: 24,
                  color: Color(0xFFA0AEC0),
                ),
              ),
            ],
          ),
          hideDivider == true
              ? const SizedBox()
              : Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  color: const Color(0xFFEDF2F7),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(''),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.iconPath,
  });

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      padding: EdgeInsets.all(8.w),
      decoration: const BoxDecoration(
        color: Color(0xFFE4ECF7),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SvgPicture.asset(
        iconPath,
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}

class CardRounded16 extends StatelessWidget {
  const CardRounded16({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.color,
    this.decoration,
  });

  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 112,
      width: width ?? 112,
      padding: const EdgeInsets.only(top: 10, left: 14, bottom: 10, right: 10),
      decoration: decoration ??
          BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
      child: child,
    );
  }
}
