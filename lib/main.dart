import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


import 'package:catbreeds_riverpod/config/theme/app_theme.dart';
import 'package:catbreeds_riverpod/config/router/app_router.dart';
import 'package:catbreeds_riverpod/config/constants/environment.dart';

import 'package:catbreeds_riverpod/config/localization/app_localizations_delegate.dart';
import 'package:catbreeds_riverpod/config/localization/app_localizations_enum.dart';

import 'package:catbreeds_riverpod/infraestructure/services/cat_api_dio_service.dart';

import 'package:catbreeds_riverpod/presentation/providers/breeds/breeds_provider.dart';



Future<void> main() async {

  await dotenv.load(fileName: '.env');
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final languageCode = PlatformDispatcher.instance.locale.languageCode;
  await const AppLocalizationsDelegate().load(Locale(languageCode));

  CatApiDioService().configureDio();
  CatApiDioService().configureApiKey(Environment.theCatApiKey);

  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}


class MyApp extends ConsumerWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef  ref) {

    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getBreedsData(ref);
    });
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale(AppLocaleEnum.english.code),
        Locale(AppLocaleEnum.spanish.code)
      ],
      routerConfig: appRouter,
      theme: AppTheme(isDarkMode: false).getTheme(),
    );
      
  }
}