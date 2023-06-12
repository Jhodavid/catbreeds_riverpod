import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


import 'package:catbreeds_riverpod/config/theme/app_theme.dart';
import 'package:catbreeds_riverpod/config/router/app_router.dart';
import 'package:catbreeds_riverpod/config/localization/app_localizations_delegate.dart';
import 'package:catbreeds_riverpod/config/localization/app_localizations_enum.dart';

// import 'package:catbreeds_bloc/data/services/cat_api_dio_service.dart';
// import 'package:catbreeds_bloc/data/utils/domain/environment.dart';

// import 'package:catbreeds_bloc/domain/blocs/app/app_bloc.dart';
// import 'package:catbreeds_bloc/domain/blocs/breeds/breeds_bloc.dart';

// import 'package:catbreeds_bloc/device/localization/app_localizations_enum.dart';
// import 'package:catbreeds_bloc/device/localization/app_localizations_delegate.dart';

// import 'package:catbreeds_bloc/ui/router/app_router.dart';
// import 'package:catbreeds_bloc/ui/themes/app_theme.dart';



Future<void> main() async {

  await dotenv.load(fileName: '.env');
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final languageCode = PlatformDispatcher.instance.locale.languageCode;
  await const AppLocalizationsDelegate().load(Locale(languageCode));

  // CatApiDioService().configureDio();
  // CatApiDioService().configureApiKey(Environment.theCatApiKey);

  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    FlutterNativeSplash.remove();

    // BlocProvider.of<BreedsBloc>(context).getCatBreedsData();
    
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