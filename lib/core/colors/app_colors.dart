import 'package:flutter/material.dart';

class AppColors {
  static const Color rootBgColor = Color(0XFFEEF2F6);
  static const Color primary = Color(0xFF3DBDEC);
  static const Color secondary = Color(0xFF1F2B5B);
  static const Color primaryHover = Color.fromARGB(255, 29, 162, 211);
  static const Color primaryLight = Color(0XFFE0E7FF);
  static const Color primaryDark = Color(0XFF444444);
  static const Color velvet = Color(0XFF7436F8);
  static const Color onBackground = Color(0XFF1F1F1F);
  static const Color surface = Color(0XFF292929);
  static const Color marksSmallContainer = Color(0XFFFAEFEF);

  //text
  static const Color textMain = Color(0XFF2B2F3B);
  static const Color textSecondary = Color(0XFF858B91);
  static const Color signInTextColor = Color(0xFF262626);
  static const Color logInInTextColor = Color(0xFF8A8B8C);

  //neutral
  static const Color iconMain = Color(0XFF313235);
  static const Color iconSecondary = Color(0XFFA7A7A7);
  static const Color outline = Color(0XFFDEDEDE);
  static const Color stroke = Color(0XFFECECEC);
  static const Color background = Color(0XFFF6F6F6);
  static const Color backgroundModule = Color(0XFFF5F5F5);
  static const Color inputField = Color(0XFFF5F5F5);
  static const Color float = Color(0XFFFFFFFF);
  static const Color miscellaneousTabUnselected = Color(0XFF999999);
  static const Color foregroundTertiaryRest = Color(0XFFA2A2A2);
  static const Color dividerColor = Color(0XFFE1E1E1);
  static const Color borderDividerColor = Color(0XFFD9D9D9);
  static const Color usefulAppsBgColor = Color(0XFFF7F7F7);
  static const Color singleCityTitleColor = Color(0XFF5B5F64);
  static const Color onPrimary = Color(0XFFFFFFFF);
  static const Color buttonDisabled = Color(0XFFF2F2F2);

  //system
  static const Color error = Color(0XFFEA4C4C);
  static const Color success = Color(0XFF1AB269);
  static const Color warning = Color(0XFFFCC65E);

  //accent
  static const Color poppy = Color(0XFF1098C3);
  static const Color mindaro = Color(0XFFBCE784);
  static const Color emirald = Color(0XFF5DD39E);
  static const Color bittersweet = Color(0XFFFF715B);
  static const Color crayola = Color(0XFFFB6376);

  static const secondaryDark = Color(0xffA6B7D4);
  static const accent = Color(0xff05BAD1);
  static const red = Color(0xFFd32f2f);
  static const expressRed = Color(0xFFE53333);
  static const systemRed = Color(0xFFFF3B30);
  static const pink = Color(0xffE5326E);
  static const yellow = Color.fromARGB(255, 253, 209, 77);
  static const transparent = Color(0x00FFFFFF);
  static const black = Color(0xFF000000);
  static const grey2 = Color(0xFF4F4F4F);
  static const white = Color(0xFFffffff);
  static const border = Color(0xFFD0D0D0);
  static const focusedBorder = Color(0xFF140F1E);
  static const textTitle = Color(0xFF140F1E);
  static const greyDisabled = Color(0xFFE7E7E7);
  static const labelColor = Color(0xFF3C3C43);
  static const hintColor = Color(0xFFC4C4C4);
  static const iconColor = Color(0xFFBABABA);
  static const switcherCircleColor = Color(0xFFEBEBEB);
  static const backgroundColor = Color(0xFFEDF2F7);
  // static const backgroundColorDark = Color(0xFF161d31);
  static const backgroundColorDark = Color(0xff303030);
  static const darkGrey = Color(0xFF9C99A0);
  static const lightGrey = Color(0xFF888888);
  static const disabledButtonBg = Color(0xFFB6C5D1);
  static const textFieldGreyBg = Color(0xFFF0F3F6);
  static const textFieldHintColor = Color(0xFFB6C5D1);
  static const textColorDarkBlue = Color(0xFF171F46);

  static const textColorLight = Color(0xFF140F1E);
  static const textColorDark = Color(0xFFb4b7bd);
  static const textColorSubtitleGray = Color(0xFFb2bac6);

  static const crimson = Color(0xffE52E71);
  static const orange = Color(0xffFF8A00);
  static const orange2 = Color(0xffFF8C00);
  static const orange3 = Color(0xFFFFF2DA);

  static const crimsonAlt = Color(0xFFED5C65);
  static const deepOrange = Color(0xffde5335);
  static const custom = Color(0xfff05640);
  static const mapBorder = Color(0xFFE5326E);
  static const darkPurple = Color(0xff292432);
  static const cF1F1F1 = Color(0xffF1F1F1);
  static const c_1d1427 = Color(0xff1d1427);
  static const backgroundOverly = Color(0x99333333);
  static const backgroundAlt = Color(0xFFFCFCFC);
  static const violet = Color(0xFF4B1BD3);
  static const darkBlack = Color(0xFF1E1428);
  static const borderColor = Color(0xFFC4C4C4);
  static const alertBack = Color(0xFFF2F2F2);

  static const textColorPrimary = Color(0xFF3754DB);
  static const textBodyLight = Color(0xFF425466);
  static const colorGray900 = Color(0xFF1A202C);
  static const colorGray800 = Color(0xFF2D3748);
  static const colorGray700 = Color(0xFF4A5568);
  static const colorGray600 = Color(0xFF718096);
  static const colorGray500 = Color(0xFFA0AEC0);
  static const colorGray300 = Color(0xFFE2E8F0);
  static const colorGray200 = Color(0xFFE4ECF7);

  static const boxShadow = Color.fromRGBO(255, 242, 218, 0.1);
  static const boxShadow2 = Color.fromRGBO(167, 155, 137, 0.1);
  static List<BoxShadow> get defaultShadow => [
        const BoxShadow(
          color: boxShadow,
          blurRadius: 15.0,
          spreadRadius: 3.0,
          offset: Offset(0.0, 3.0),
        ),
        const BoxShadow(
          color: boxShadow2,
          blurRadius: 15.0,
          spreadRadius: 3.0,
          offset: Offset(0.0, 3.0),
        ),
      ];
}

class Palette {
  // Brand/Primary
  static const Color primary25 = Color(0xFFF4F7FF);
  static const Color primary50 = Color(0xFFEAEEFE);
  static const Color primary75 = Color(0xFFDFE6FE);
  static const Color primary100 = Color(0xFFD4DEFE);
  static const Color primary150 = Color(0xFFBFCDFD);
  static const Color primary200 = Color(0xFFAABDFC);
  static const Color primary300 = Color(0xFF7F9BFB);
  static const Color primary400 = Color(0xFF557AF9);
  static const Color primary500 = Color(0xFF2A59F8);
  static const Color primary600 = Color(0xFF2247C6);
  static const Color primary700 = Color(0xFF193595);
  static const Color primary800 = Color(0xFF112463);
  static const Color primary850 = Color(0xFF0D1B4A);
  static const Color primary900 = Color(0xFF081232);
  static const Color primary925 = Color(0xFF060D25);
  static const Color primary950 = Color(0xFF040919);
  static const Color primary975 = Color(0xFF02040C);
  static const Color primary1000 = Color(0xFF000000);

  // Brand/Primary-grey
  static const Color primaryGrey25 = Color(0xFFF6F6F7);
  static const Color primaryGrey50 = Color(0xFFEDEDEF);
  static const Color primaryGrey75 = Color(0xFFE7E8E9);
  static const Color primaryGrey100 = Color(0xFFDBDCDF);
  static const Color primaryGrey150 = Color(0xFFC9CAD0);
  static const Color primaryGrey200 = Color(0xFFB7B9C0);
  static const Color primaryGrey300 = Color(0xFF9396A0);
  static const Color primaryGrey400 = Color(0xFF6F7381);
  static const Color primaryGrey500 = Color(0xFF4B5061);
  static const Color primaryGrey600 = Color(0xFF3C404E);
  static const Color primaryGrey700 = Color(0xFF2D303A);
  static const Color primaryGrey800 = Color(0xFF1E2027);
  static const Color primaryGrey850 = Color(0xFF17181D);
  static const Color primaryGrey900 = Color(0xFF0F1013);
  static const Color primaryGrey925 = Color(0xFF0B0C0F);
  static const Color primaryGrey950 = Color(0xFF08080A);
  static const Color primaryGrey975 = Color(0xFF040405);
  static const Color primaryGrey1000 = Color(0xFF000000);

  // White
  static const Color white10 = Color(0xFFFFFF05);
  static const Color white25 = Color(0xFFFFFF0A);
  static const Color white50 = Color(0xFFFFFF12);
  static const Color white75 = Color(0xFFFFFF1A);
  static const Color white100 = Color(0xFFFFFF33);
  static const Color white200 = Color(0xFFFFFF66);
  static const Color white300 = Color(0xFFFFFF99);
  static const Color white400 = Color(0xFFFFFFCC);
  static const Color whiteBasic = Color(0xFFFFFFFF);

  // Black
  static const Color black10 = Color(0xFF05050505);
  static const Color black25 = Color(0xFF0505050A);
  static const Color black50 = Color(0xFF05050512);
  static const Color black75 = Color(0xFF0505051A);
  static const Color black100 = Color(0xFF05050533);
  static const Color black200 = Color(0xFF05050566);
  static const Color black300 = Color(0xFF05050599);
  static const Color black400 = Color(0xFF050505CC);
  static const Color blackBasic = Color(0xFF050505);

  // Grey
  static const Color grey0 = Color(0xFFFFFFFF);
  static const Color grey25 = Color(0xFFF9F9F9);
  static const Color grey50 = Color(0xFFF3F3F3);
  static const Color grey75 = Color(0xFFEEEEEE);
  static const Color grey100 = Color(0xFFE8E8E8);
  static const Color grey150 = Color(0xFFDCDCDC);
  static const Color grey200 = Color(0xFFD1D1D1);
  static const Color grey300 = Color(0xFFB9B9B9);
  static const Color grey400 = Color(0xFFA2A2A2);
  static const Color grey500 = Color(0xFF8B8B8B);
  static const Color grey600 = Color(0xFF6F6F6F);
  static const Color grey700 = Color(0xFF535353);
  static const Color grey750 = Color(0xFF404040);
  static const Color grey800 = Color(0xFF383838);
  static const Color grey825 = Color(0xFF2E2E2E);
  static const Color grey850 = Color(0xFF2A2A2A);
  static const Color grey875 = Color(0xFF242424);
  static const Color grey900 = Color(0xFF1C1C1C);
  static const Color grey925 = Color(0xFF151515);
  static const Color grey950 = Color(0xFF0E0E0E);
  static const Color grey975 = Color(0xFF070707);
  static const Color grey1000 = Color(0xFF000000);

  // Red
  static const Color red25 = Color(0xFFFEF6F6);
  static const Color red50 = Color(0xFFFDECEC);
  static const Color red75 = Color(0xFFFDE3E3);
  static const Color red100 = Color(0xFFFCDADA);
  static const Color red150 = Color(0xFFFAC7C7);
  static const Color red200 = Color(0xFFF9B4B4);
  static const Color red300 = Color(0xFFF58F8F);
  static const Color red400 = Color(0xFFF26969);
  static const Color red500 = Color(0xFFEF4444);
  static const Color red600 = Color(0xFFBF3636);
  static const Color red700 = Color(0xFF8F2929);
  static const Color red800 = Color(0xFF601B1B);
  static const Color red850 = Color(0xFF481414);
  static const Color red900 = Color(0xFF300E0E);
  static const Color red925 = Color(0xFF240A0A);
  static const Color red950 = Color(0xFF180707);
  static const Color red975 = Color(0xFF0C0303);
  static const Color red1000 = Color(0xFF000000);

  // Orange
  static const Color orange25 = Color(0xFFFFF8F3);
  static const Color orange50 = Color(0xFFFFF1E8);
  static const Color orange75 = Color(0xFFFEEADC);
  static const Color orange100 = Color(0xFFFEE3D0);
  static const Color orange150 = Color(0xFFFDD5B9);
  static const Color orange200 = Color(0xFFFDC7A2);
  static const Color orange300 = Color(0xFFFBAB73);
  static const Color orange400 = Color(0xFFFA8F45);
  static const Color orange500 = Color(0xFFF97316);
  static const Color orange600 = Color(0xFFC75C12);
  static const Color orange700 = Color(0xFF95450D);
  static const Color orange800 = Color(0xFF642E09);
  static const Color orange850 = Color(0xFF4B2307);
  static const Color orange900 = Color(0xFF321704);
  static const Color orange925 = Color(0xFF251103);
  static const Color orange950 = Color(0xFF190C02);
  static const Color orange975 = Color(0xFF0C0601);
  static const Color orange1000 = Color(0xFF000000);

  // Green
  static const Color green25 = Color(0xFFF4FCF7);
  static const Color green50 = Color(0xFFE9F9EF);
  static const Color green75 = Color(0xFFDEF6E7);
  static const Color green100 = Color(0xFFD3F3DF);
  static const Color green150 = Color(0xFFBDEECF);
  static const Color green200 = Color(0xFFA7E8BF);
  static const Color green300 = Color(0xFF7ADC9E);
  static const Color green400 = Color(0xFF4ED17E);
  static const Color green500 = Color(0xFF22C55E);
  static const Color green600 = Color(0xFF1B9E4B);
  static const Color green700 = Color(0xFF147638);
  static const Color green800 = Color(0xFF0E4F26);
  static const Color green850 = Color(0xFF0A3B1C);
  static const Color green900 = Color(0xFF072713);
  static const Color green925 = Color(0xFF051E0E);
  static const Color green950 = Color(0xFF031409);
  static const Color green975 = Color(0xFF020A05);
  static const Color green1000 = Color(0xFF000000);

  // Brand/Secondary
  static const Color secondary25 = Color(0xFFFCFFF4);
  static const Color secondary50 = Color(0xFFF9FEEA);
  static const Color secondary75 = Color(0xFFF6FEDF);
  static const Color secondary100 = Color(0xFFF2FED4);
  static const Color secondary150 = Color(0xFFECFDBF);
  static const Color secondary200 = Color(0xFFE6FCAA);
  static const Color secondary300 = Color(0xFFD9FB7F);
  static const Color secondary400 = Color(0xFFCDF955);
  static const Color secondary500 = Color(0xFFC0F82A);
  static const Color secondary600 = Color(0xFF9AC622);
  static const Color secondary700 = Color(0xFF739519);
  static const Color secondary800 = Color(0xFF4D6311);
  static const Color secondary850 = Color(0xFF3A4A0D);
  static const Color secondary900 = Color(0xFF263208);
  static const Color secondary925 = Color(0xFF1D2506);
  static const Color secondary950 = Color(0xFF131904);
  static const Color secondary975 = Color(0xFF0A0C02);
  static const Color secondary1000 = Color(0xFF000000);

  static const Color borderDividerColor = Color(0XFFD9D9D9);
  static const boxShadow = Color.fromRGBO(255, 242, 218, 0.1);
  static const boxShadow2 = Color.fromRGBO(167, 155, 137, 0.1);
  static List<BoxShadow> get defaultShadow => [
        const BoxShadow(
          color: boxShadow,
          blurRadius: 15.0,
          spreadRadius: 3.0,
          offset: Offset(0.0, 3.0),
        ),
        const BoxShadow(
          color: boxShadow2,
          blurRadius: 15.0,
          spreadRadius: 3.0,
          offset: Offset(0.0, 3.0),
        ),
      ];
}
