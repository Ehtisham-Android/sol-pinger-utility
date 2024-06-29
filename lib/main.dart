import 'package:dart_ping/dart_ping.dart';
import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sol_pinger_utility/core/theme/fifo_app_theme.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_bloc.dart';

import 'core/constants/app_shared_prefs.dart';
import 'core/constants/constants.dart';
import 'core/firebase/firebase_helper.dart';
import 'firebase_options.dart';
import 'locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sol pinger',
//       debugShowCheckedModeBanner: false,
//       onGenerateTitle: (context) {
//         return AppLocalizations.of(context).appName;
//       },
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       locale: localeModel.locale,
//       localeListResolutionCallback: (allLocales, supportedLocales) {
//         if (prefs.selectedLanguage.contains(LanguageCodes.ar)) {
//           return const Locale(LanguageCodes.en, 'SA');
//         }
//         return const Locale(LanguageCodes.en, 'US');
//       },
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

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
              title: 'Fifo plus',
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
              home: const MyHomePage()),
          // home: const CatalogScreen()),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  PingData? _lastPing;
  final TextEditingController _controller =
  TextEditingController(text: 'google.com');

  void _startPing() {
    // Create instance of DartPing
    final ping = Ping(_controller.text, count: 3);
    print('Running command: ${ping.command}');
    ping.stream.listen((event) {
      setState(() {
        _lastPing = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DartPing Flutter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              _lastPing?.toString() ?? 'Push the button to begin ping',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startPing,
        tooltip: 'Start Ping',
        child: const Icon(Icons.radar_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
