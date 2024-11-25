import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/models/category_models/category_item.dart';
import 'package:spendsmart/models/category_models/saving_category_items.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/routing/profile_routes.dart';
import 'package:spendsmart/screens/analisis_screens/analysis_main_screen.dart';
import 'package:spendsmart/screens/auth_screens/auth_screen.dart';
import 'package:spendsmart/screens/auth_screens/reset_password_screen.dart';
import 'package:spendsmart/screens/categories_screens/categories_main_screen.dart';
import 'package:spendsmart/screens/home_screens/home_main_screen.dart';
import 'package:spendsmart/screens/loading_screens/loading_screen.dart';
import 'package:spendsmart/screens/main_screen/main_screen.dart';
import 'package:spendsmart/screens/onboarding_screens/onboarding_screen.dart';
import 'package:spendsmart/screens/profile_screens/profile_main_screen.dart';
import 'package:spendsmart/screens/transactions_screens/transactions_main_screen.dart';

import '../screens/launch_screens/splash_screen.dart';
import 'categories_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorAnalysisKey =
    GlobalKey<NavigatorState>(debugLabel: 'analysis');
final _shellNavigatorTransactionKey =
    GlobalKey<NavigatorState>(debugLabel: 'transaction');
final _shellNavigatorCategoryKey =
    GlobalKey<NavigatorState>(debugLabel: 'category');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile');

final goRouter = GoRouter(
  initialLocation: '/${Screens.splash}',
  // * Passing a navigatorKey causes an issue on hot reload:
  // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
  // * However it's still necessary otherwise the navigator pops back to
  // * root on hot reload
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        name: Screens.splash,
        path: '/${Screens.splash}',
        builder: (context, state) {
          return const SplashScreen();
        }),
    GoRoute(
        name: Screens.onboarding,
        path: '/${Screens.onboarding}',
        builder: (context, state) {
          return const OnboardingScreen();
        }),

    GoRoute(
        name: Screens.auth,
        path: '/${Screens.auth}',
        builder: (context, state) {
          return const AuthScreen();
        },
        routes: [
          GoRoute(
              name: Screens.resetPassword,
              path: Screens.resetPassword,
              builder: (context, state) {
                return const ResetPasswordScreen();
              }),
        ]),

    GoRoute(
        name: Screens.loading,
        path: '/${Screens.loading}',
        builder: (context, state) {
          return const LoadingScreen();
        }),

    // Stateful navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // print("state.fullPath :: ${state.fullPath}");

        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              name: Screens.homeMain,
              path: '/${Screens.homeMain}',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: HomeMainScreen(),
                );
              },
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAnalysisKey,
          routes: [
            GoRoute(
              name: Screens.analysisMain,
              path: '/${Screens.analysisMain}',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: AnalysisMainScreen(),
                );
              },
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorTransactionKey,
          routes: [
            // Shopping Cart
            GoRoute(
              name: Screens.transactionsMain,
              path: '/${Screens.transactionsMain}',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: TransactionsMainScreen(),
                );
              },
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCategoryKey,
          routes: [
            // Shopping Cart
            GoRoute(
              name: Screens.categoriesMain,
              path: '/${Screens.categoriesMain}',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: CategoriesMainScreen(),
                );
              },
              routes: categoriesRoutes,
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            // Shopping Cart
            GoRoute(
              name: Screens.profileMain,
              path: '/${Screens.profileMain}',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: ProfileMainScreen(),
                );
              },
              routes: profileRoutes,
            ),
          ],
        ),
      ],
    ),
  ],
  extraCodec: const CustomGoRouterCodec(),
);

// Create a codec that implements Codec<Object?, Object?>
class CustomGoRouterCodec extends Codec<Object?, Object?> {
  const CustomGoRouterCodec();
  // Need to implement encoder and decoder
  @override
  final Converter<Object?, Object?> encoder = const _CustomEncoder();
  @override
  final Converter<Object?, Object?> decoder = const _CustomDecoder();
}

// Implement the encoder
class _CustomEncoder extends Converter<Object?, Object?> {
  const _CustomEncoder();
  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    if (input is CategoryItem) {
      return {
        'type': 'CategoryItem',
        'data': input.toJson(),
      };
    }
    if (input is SavingCategoryItems) {
      return {
        'type': 'SavingCategoryItems',
        'data': input.toJson(),
      };
    }
    return input;
  }
}

// Implement the decoder
class _CustomDecoder extends Converter<Object?, Object?> {
  const _CustomDecoder();
  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    if (input is Map<String, dynamic>) {
      if (input['type'] == 'CategoryItem') {
        return CategoryItem.fromJson(input['data'] as Map<String, dynamic>);
      }
      if (input['type'] == 'SavingCategoryItems') {
        return SavingCategoryItems.fromJson(
            input['data'] as Map<String, dynamic>);
      }
    }
    return input;
  }
}

Future<bool?> showExitConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false, // User must tap a button to dismiss the dialog
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Exit'),
        content: const Text('Do you really want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              isPopUpShow = false;
              Navigator.of(context).pop(true); // User pressed cancel
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              isPopUpShow = false;
              Navigator.of(context).pop(false); // User pressed exit
            },
            child: const Text('Exit'),
          ),
        ],
      );
    },
  );
}

bool isPopUpShow = false;
