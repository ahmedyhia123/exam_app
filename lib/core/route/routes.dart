import 'package:exam_app/core/DI/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/provider/app_config_provider.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/auth/presentation/views/login_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Route onGenerate(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? '/');

    switch (url.path) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(),
                Text(AppLocalizations.of(context)!.appName),
                FilledButton(
                  onPressed: () {
                    if (getIt<AppConfigProvider>().isEn()) {
                      getIt<AppConfigProvider>().changeLocale('ar');
                    } else {
                      getIt<AppConfigProvider>().changeLocale('en');
                    }
                  },
                  child: Text(
                    'change locale to ${getIt<AppConfigProvider>().isEn() ? 'ar' : 'en'}',
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
