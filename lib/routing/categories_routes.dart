import 'package:go_router/go_router.dart';
import 'package:spendsmart/models/category_models/category_item.dart';
import 'package:spendsmart/models/category_models/saving_category_items.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/screens/categories_screens/screens/add_category_amount_screen.dart';
import 'package:spendsmart/screens/categories_screens/screens/category_screen.dart';
import 'package:spendsmart/screens/categories_screens/screens/saving_category_screen.dart';
import 'package:spendsmart/screens/categories_screens/screens/savings_screen.dart';

import '../screens/categories_screens/screens/add_savings_screen.dart';

List<RouteBase> categoriesRoutes = [
  GoRoute(
    name: Screens.category,
    path: Screens.category,
    builder: (context, state) {
      return CategoryScreen(
        categoryItem: state.extra as CategoryItem,
      );
    },
  ),
  GoRoute(
    name: Screens.addCategoryAmount,
    path: Screens.addCategoryAmount,
    builder: (context, state) {
      return const AddCategoryAmountScreen();
    },
  ),
  GoRoute(
    name: Screens.savings,
    path: Screens.savings,
    builder: (context, state) {
      return const SavingsScreen();
    },
  ),
  GoRoute(
    name: Screens.savingCategory,
    path: Screens.savingCategory,
    builder: (context, state) {
      return SavingCategoryScreen(
        savingCategoryItems: state.extra as SavingCategoryItems,
      );
    },
  ),
  GoRoute(
    name: Screens.addSavings,
    path: Screens.addSavings,
    builder: (context, state) {
      return const AddSavingsScreen();
    },
  ),
];
