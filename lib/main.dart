import 'package:cuzdan/service/initilization.dart';
import 'package:cuzdan/core/constant/app/app_constants.dart';
import 'package:cuzdan/core/init/language/language_manager.dart';
import 'package:cuzdan/core/init/language/locale_keys.g.dart';
import 'package:cuzdan/core/init/memory/preferences_manager.dart';
import 'package:cuzdan/core/init/navigation/navigation_service.dart';
import 'package:cuzdan/core/init/notifier/provider_list.dart';
import 'package:cuzdan/core/init/notifier/theme_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/init/navigation/navigation_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferencesManager.preferencesInit();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH,
        child: MyApp(),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LocaleKeys.base_app_name,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: Provider.of<ThemeNotifier>(context, listen: true).currentTheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      home: initiator(),
    );
  }
}
