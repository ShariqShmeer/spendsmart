import 'package:go_router/go_router.dart';
import 'package:spendsmart/models/category_models/category_item.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/screens/categories_screens/screens/category_screen.dart';

List<RouteBase> categoriesRoutes = [
  GoRoute(
    name: Screens.category,
    path: Screens.category,
    builder: (context, state) {
      return CategoryScreen(categoryItem: state.extra as CategoryItem);
    },
  ),
];
