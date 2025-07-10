import 'package:exam_app/core/DI/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/provider/app_config_provider.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/core/route/routes.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await getIt<AppConfigProvider>().setSlectedLocale();
  runApp(
    ChangeNotifierProvider.value(
      value: getIt<AppConfigProvider>(),
      child: MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  late AppConfigProvider appConfigProvider;

  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      locale: Locale(appConfigProvider.slelectedlocale),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThem.ligtScheme,
      initialRoute: AppRoutes.login,
      onGenerateRoute: Routes.onGenerate,
    );
  }
}
