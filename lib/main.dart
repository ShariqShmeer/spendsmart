import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/bloc/key_board_track_bloc/key_board_track_bloc.dart';
import 'package:spendsmart/res/app_theme.dart';
import 'package:spendsmart/routing/routing.dart';

import 'bloc/theme_bloc/theme_bloc.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  FlutterError.onError = (errorDetails) {
    print('🚨 Flutter Error: ${errorDetails.exception}');
    print('🔍 Stack Trace: ${errorDetails.stack}');
  };

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  // static _MyAppState? of(BuildContext context) =>
  //     context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  void _setStatusBarTheme(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // or any color for light theme
          systemNavigationBarIconBrightness: Brightness.dark,

          /// or any color for light theme
          statusBarIconBrightness:
              Brightness.dark, // For dark icons in light theme
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // or any color for dark theme
          statusBarIconBrightness: Brightness.light, // For
          systemNavigationBarIconBrightness:
              Brightness.light, // For light icons in dark theme
        ),
      );
    }
  }

  @override
  void initState() {
    _setStatusBarTheme(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<KeyBoardTrackBloc>(
            create: (context) => KeyBoardTrackBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(440, 956),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return BlocConsumer<ThemeBloc, ThemeState>(
            listener: (context, state) {
              _setStatusBarTheme(context);
            },
            builder: (context, state) {
              return MaterialApp.router(
                routerConfig: goRouter,
                title: 'Spend Smart',
                theme: AppTheme.lightTheme(sizeMultiplier: 1.sp),
                darkTheme: AppTheme.darkTheme(sizeMultiplier: 1.sp),
                themeMode: state.themeMode,
                themeAnimationDuration: const Duration(milliseconds: 500),
                themeAnimationCurve: Curves.ease,
              );
            },
          );
        },
        // child: const SplashScreen(),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    print('onClose -- bloc: ${bloc.runtimeType}');
  }
}
