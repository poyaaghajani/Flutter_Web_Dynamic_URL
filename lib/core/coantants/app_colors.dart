import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// base
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color bg = Color(0xffFAFAFA);
  static const Color transparent = Colors.transparent;

  /// grey
  static const Color grey25 = Color(0xffF1F1F1);
  static const Color grey50 = Color(0xffE4E4E4);
  static const Color grey100 = Color(0xffD7D7D7);
  static const Color grey200 = Color(0xffCACACA);
  static const Color grey300 = Color(0xffBDBDBD);
  static const Color grey400 = Color(0xffB0B0B0);
  static const Color grey = Color(0xffA3A3A3);
  static const Color grey600 = Color(0xff8B8B8B);
  static const Color grey700 = Color(0xff5D5D5D);
  static const Color grey800 = Color(0xff454545);
  static const Color grey900 = Color(0xff2E2E2E);
  static const Color grey950 = Color(0xff171717);
  static const Color greyCustom = Color(0xff9CB0C9);
  static const Color greyCustomChatBg = Color(0xffF9FAFB);

  /// primary
  static const Color primary25 = Color(0xffe2ebe9);
  static const Color primary50 = Color(0xffc6d7d4);
  static const Color primary100 = Color(0xffaac3bf);
  static const Color primary200 = Color(0xff8dafa9);
  static const Color primary300 = Color(0xff719b94);
  static const Color primary400 = Color(0xff55877f);
  static const Color primary500 = Color(0xff387369);
  static const Color primary600 = Color(0xff1c5f54);
  static const Color primary = Color(0xff004c3f);
  static const Color primary800 = Color(0xff003b31);
  static const Color primary900 = Color(0xff002a23);
  static const Color primary950 = Color(0xff001915);

  /// secondary
  static const Color secondary25 = Color(0xfff3fbf7);
  static const Color secondary50 = Color(0xffF0FFF7);
  static const Color secondary100 = Color(0xffD0FFE5);
  static const Color secondary200 = Color(0xffB0FFD4);
  static const Color secondary300 = Color(0xff8DFABF);
  static const Color secondary400 = Color(0xff68EFA6);
  static const Color secondary = Color(0xff50CD89);
  static const Color secondary600 = Color(0xff3BAB6E);
  static const Color secondary700 = Color(0xff298955);
  static const Color secondary800 = Color(0xff1A673D);
  static const Color secondary900 = Color(0xff0F4527);
  static const Color secondaryCustom = Color(0xffE4FAC9);

  /// tertiary
  static const Color tertiary25 = Color(0xffffe7df);
  static const Color tertiary50 = Color(0xffffcfbf);
  static const Color tertiary100 = Color(0xffffb7a0);
  static const Color tertiary200 = Color(0xffff9f80);
  static const Color tertiary300 = Color(0xffff8761);
  static const Color tertiary400 = Color(0xffff6f41);
  static const Color tertiary = Color(0xffFF5722);
  static const Color tertiary600 = Color(0xffda4a1d);
  static const Color tertiary700 = Color(0xffb63e18);
  static const Color tertiary800 = Color(0xff913113);
  static const Color tertiary900 = Color(0xff6d250e);
  static const Color tertiary950 = Color(0xff481809);

  /// error
  static const Color error25 = Color(0xffFFFBFA);
  static const Color error50 = Color(0xffFEF3F2);
  static const Color error100 = Color(0xffFEE4E2);
  static const Color error200 = Color(0xffFECDCA);
  static const Color error300 = Color(0xffFDA29B);
  static const Color error400 = Color(0xffF97066);
  static const Color error = Color(0xffF04438);
  static const Color error600 = Color(0xffD92D20);
  static const Color error700 = Color(0xffB42318);
  static const Color error800 = Color(0xff912018);
  static const Color error900 = Color(0xff7A271A);

  /// warning
  static const Color warning25 = Color(0xffFFFCF5);
  static const Color warning50 = Color(0xffFFFAEB);
  static const Color warning100 = Color(0xffFEF0C7);
  static const Color warning200 = Color(0xffFEDF89);
  static const Color warning300 = Color(0xffFEC84B);
  static const Color warning400 = Color(0xffFDB022);
  static const Color warning = Color(0xffF79009);
  static const Color warning600 = Color(0xffDC6803);
  static const Color warning700 = Color(0xffB54708);
  static const Color warning800 = Color(0xff93370D);
  static const Color warning900 = Color(0xff7A2E0E);

  /// success
  static const Color success25 = Color(0xffF6FEF9);
  static const Color success50 = Color(0xffECFDF3);
  static const Color success100 = Color(0xffD1FADF);
  static const Color success200 = Color(0xffA6F4C5);
  static const Color success300 = Color(0xff6CE9A6);
  static const Color success400 = Color(0xff32D583);
  static const Color success = Color(0xff12B76A);
  static const Color success600 = Color(0xff039855);
  static const Color success700 = Color(0xff027A48);
  static const Color success800 = Color(0xff05603A);
  static const Color success900 = Color(0xff054F31);

  /// pink
  static const Color pink25 = Color(0xffFEF6FB);
  static const Color pink50 = Color(0xffFDF2FA);
  static const Color pink100 = Color(0xffFCE7F6);
  static const Color pink200 = Color(0xffFCCEEE);
  static const Color pink300 = Color(0xffFAA7E0);
  static const Color pink400 = Color(0xffF670C7);
  static const Color pink = Color(0xffEE46BC);
  static const Color pink600 = Color(0xffDD2590);
  static const Color pink700 = Color(0xffC11574);
  static const Color pink800 = Color(0xff9E165F);
  static const Color pink900 = Color(0xff851651);

  /// blue
  static const Color blue25 = Color(0xffF5FAFF);
  static const Color blue50 = Color(0xffEFF8FF);
  static const Color blue100 = Color(0xffD1E9FF);
  static const Color blue200 = Color(0xffB2DDFF);
  static const Color blue300 = Color(0xff84CAFF);
  static const Color blue400 = Color(0xff53B1FD);
  static const Color blue = Color(0xff2E90FA);
  static const Color blue600 = Color(0xff1570EF);
  static const Color blue700 = Color(0xff175CD3);
  static const Color blue800 = Color(0xff1849A9);
  static const Color blue900 = Color(0xff194185);
  static const Color customBlue = Color(0xff194185);

  /// orange
  static const Color orange25 = Color(0xffFFFAF5);
  static const Color orange50 = Color(0xffFFF6E9);
  static const Color orange100 = Color(0xffFFE2B7);
  static const Color orange200 = Color(0xffFFCE85);
  static const Color orange300 = Color(0xffFFBA53);
  static const Color orange400 = Color(0xffFFA621);
  static const Color orange = Color(0xffDD8B10);
  static const Color orange600 = Color(0xffBB7102);
  static const Color orange700 = Color(0xff995C00);
  static const Color orange800 = Color(0xff774700);
  static const Color orange900 = Color(0xff553300);
  static const Color customOrange = Color(0xffB54708);

  /// purple
  static const Color purple25 = Color(0xffFAFAFF);
  static const Color purple50 = Color(0xffF3EDFF);
  static const Color purple100 = Color(0xffD7C4FF);
  static const Color purple200 = Color(0xffBC9CFF);
  static const Color purple300 = Color(0xffA174FF);
  static const Color purple400 = Color(0xff854BFF);
  static const Color purple = Color(0xff7239EA);
  static const Color purple600 = Color(0xff5A26C8);
  static const Color purple700 = Color(0xff4517A6);
  static const Color purple800 = Color(0xff320B84);
  static const Color purple900 = Color(0xff220362);
}
