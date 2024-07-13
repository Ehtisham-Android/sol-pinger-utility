import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sol_pinger_utility/core/theme/fifo_app_theme.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_bloc.dart';

import 'core/constants/app_shared_prefs.dart';
import 'core/constants/constants.dart';
import 'locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'navigation/navigation_menu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.002)
    )
  );

  await setupLocator();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //
  // await FirebaseHelper().initNotifications();

  DartPingIOS.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = locator<AppSharedPref>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<HomepageBloc>()),
      ],
      child: ChangeNotifierProvider<LocaleModel>(
        create: (context) => LocaleModel(),
        child: Consumer<LocaleModel>(
          builder: (context, localeModel, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (context) {
                return "Sol pinger";
              },
              title: 'Sol pinger',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: localeModel.locale,
              localeListResolutionCallback: (allLocales, supportedLocales) {
                if (prefs.selectedLanguage.contains(LanguageCodes.ar)) {
                  return const Locale(LanguageCodes.en, 'SA');
                }
                return const Locale(LanguageCodes.en, 'US');
              },
              theme: SolPingerAppTheme.lightTheme,
              darkTheme: SolPingerAppTheme.darkTheme,
              home: const NavigationMenu()),
        ),
      ),
    );
  }
}

class LocaleModel extends ChangeNotifier {
  final prefs = locator<AppSharedPref>();
  Locale _locale = const Locale(LanguageCodes.en);

  Locale get locale => _locale;

  void set(Locale locale) {
    _locale = locale;
    prefs.selectedLanguage = locale.languageCode;
    notifyListeners();
  }
}
