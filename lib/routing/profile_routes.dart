import 'package:go_router/go_router.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/screens/profile_screens/screens/edit_profile_screen.dart';
import 'package:spendsmart/screens/profile_screens/screens/security_screen.dart';
import 'package:spendsmart/screens/profile_screens/screens/setting_screen.dart';

List<RouteBase> profileRoutes = [
  GoRoute(
    name: Screens.editProfile,
    path: Screens.editProfile,
    builder: (context, state) {
      return const EditProfileScreen();
    },
  ),
  GoRoute(
    name: Screens.security,
    path: Screens.security,
    builder: (context, state) {
      return const SecurityScreen();
    },
  ),
  GoRoute(
    name: Screens.setting,
    path: Screens.setting,
    builder: (context, state) {
      return const SettingScreen();
    },
  ),
];
