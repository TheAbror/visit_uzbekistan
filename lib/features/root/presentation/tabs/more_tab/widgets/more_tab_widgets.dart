import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

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
  return CardRounded18(
    height: 64.h,
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.profilePage);
      },
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),
              child: Image.asset('assets/images/male_avatar_placeholder.png'),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              context.localizations.fullName,
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
            Text(
              context.localizations.logout,
              style: TextStyle(
                color: AppColors.textColorDarkBlue,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
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
  final String iconPath;

  const IconContainer({
    super.key,
    required this.iconPath,
  });

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

class LanguageBtmSheet extends StatelessWidget {
  const LanguageBtmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8.h,
        bottom: 10.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetTopIcon(),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/global.svg',
                  height: 24.h,
                  width: 24.w,
                  colorFilter: ColorFilter.mode(
                    AppColors.textColorDarkBlue,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  context.localizations.chooseLanguage,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColorDarkBlue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            moreTabOptions(
              'English',
              const Locale.fromSubtags(
                languageCode: 'en',
                countryCode: 'US',
              ),
              context,
              true,
              svgFlag: Assets.icons.flags.flagEn.image(),
            ),
            moreTabOptions(
              'Русский',
              const Locale.fromSubtags(
                languageCode: 'ru',
                countryCode: 'RU',
              ),
              context,
              true,
              svgFlag: Assets.icons.flags.flagRu.image(),
            ),
            moreTabOptions(
              'Spanish',
              const Locale.fromSubtags(
                languageCode: 'es',
                countryCode: 'ES',
              ),
              context,
              true,
              svgFlag: Assets.icons.flags.flagSpain.image(),
            ),
            moreTabOptions(
              'Italiano',
              const Locale.fromSubtags(
                languageCode: 'it',
                countryCode: 'IT',
              ),
              context,
              true,
              svgFlag: Assets.icons.flags.flagItaly.image(),
            ),
            moreTabOptions(
              'French',
              const Locale.fromSubtags(
                languageCode: 'fr',
                countryCode: 'FR',
              ),
              context,
              true,
              svgFlag: Assets.icons.flags.flagFr.image(),
            ),
            moreTabOptions(
              'O\'zbekcha',
              const Locale.fromSubtags(
                languageCode: 'uz',
                countryCode: 'UZ',
              ),
              context,
              false,
              svgFlag: Assets.icons.flags.flagUz.image(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget moreTabOptions(
  String title,
  Locale locale,
  BuildContext context,
  bool showLine, {
  Widget? svgFlag,
}) {
  final code = context.read<LocalizationBloc>().state.languageCode;

  final isActive = locale.languageCode == code;

  return InkWell(
    onTap: () {
      context.read<LocalizationBloc>().changeLocalization(locale.languageCode);
    },
    child: SizedBox(
      height: 56.h,
      child: Column(
        children: [
          SizedBox(
            height: 55.h,
            child: Row(
              children: [
                svgFlag ?? SizedBox(),
                svgFlag != null ? SizedBox(width: 8.w) : SizedBox(),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF425466),
                  ),
                ),
                const Expanded(child: SizedBox()),
                SvgPicture.asset(
                    'assets/icons/checkbox_${isActive ? 'filled' : 'empty'}.svg')
              ],
            ),
          ),
          showLine
              ? Container(
                  width: double.infinity,
                  height: 1.h,
                  color: AppColors.colorGray200,
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}

class HelpBottomSheet extends StatelessWidget {
  const HelpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8.h,
        bottom: 32.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetTopIcon(),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Choose help option',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColorDarkBlue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            moreTabOptions(
              'Tourist police',
              const Locale.fromSubtags(
                languageCode: 'uz',
                countryCode: 'UZ',
              ),
              context,
              true,
            ),
            moreTabOptions(
              'Gmail',
              const Locale.fromSubtags(
                languageCode: 'ru',
                countryCode: 'RU',
              ),
              context,
              true,
            ),
            moreTabOptions(
              'Telegram',
              const Locale.fromSubtags(
                languageCode: 'en',
                countryCode: 'US',
              ),
              context,
              true,
            ),
            moreTabOptions(
              'WhatsApp',
              const Locale.fromSubtags(
                languageCode: 'uz',
                countryCode: 'UZ',
              ),
              context,
              false,
            ),
          ],
        ),
      ),
    );
  }
}
