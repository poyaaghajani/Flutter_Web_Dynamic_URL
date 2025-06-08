import 'package:aloplay_simulation/config/route/app_router.dart';
import 'package:aloplay_simulation/core/cubit/locale_cubit.dart';
import 'package:aloplay_simulation/l10n/app_localizations.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/configure_nonweb.dart'
    if (dart.library.html) 'config/configure_web.dart';

void main() async {
  /// initialize binding
  WidgetsFlutterBinding.ensureInitialized();

  await getInit();

  /// configure
  configureApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator.get<LocaleCubit>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, localeState) {
        return MaterialApp.router(
          title: 'Alo Play',
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          locale: localeState,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
