import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/models/category_models/category_item.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/res/app_size.dart';
import 'package:spendsmart/widgets/balance_overview_widget.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class CategoriesMainScreen extends StatefulWidget {
  const CategoriesMainScreen({super.key});

  @override
  State<CategoriesMainScreen> createState() => _CategoriesMainScreenState();
}

class _CategoriesMainScreenState extends State<CategoriesMainScreen> {
  double expense = 3400;
  double balance = 5897;

  final List<CategoryItem> categories = [
    CategoryItem(
      id: 1,
      iconData: Icons.fastfood_outlined,
      title: 'Food',
    ),
    // Food
    CategoryItem(
      id: 2,
      iconData: Icons.directions_bus_outlined,
      title: 'Transport',
    ),
    // Transport
    CategoryItem(
      id: 3,
      iconData: Icons.local_hospital_outlined,
      title: 'Medicine',
    ),
    // Medicine
    CategoryItem(
      id: 4,
      iconData: Icons.shopping_cart_outlined,
      title: 'Groceries',
    ),
    // Groceries
    CategoryItem(
      id: 5,
      iconData: Icons.home_outlined,
      title: 'Rent',
    ),
    // Rent
    CategoryItem(
      id: 6,
      iconData: Icons.card_giftcard_outlined,
      title: 'Gifts',
    ),
    // Gifts
    CategoryItem(
      id: 7,
      iconData: Icons.savings_outlined,
      title: 'Savings',
    ),
    // Savings
    CategoryItem(
      id: 8,
      iconData: Icons.movie_outlined,
      title: 'Entertainment',
    ),
    // Entertainment
    CategoryItem(
      id: 9,
      iconData: Icons.add,
      title: 'More',
    ),
    // More
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      roundedBodyPercentage: 75,
      topWidget: Center(
        child: BalanceOverView(
          totalAmount: balance,
          expenseAmount: expense,
        ),
      ),
      roundedBodyWidget: GridView.builder(
          padding: EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 50.h),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5.h,
            crossAxisSpacing: 15.w,
            childAspectRatio: 0.90,
          ),
          itemBuilder: (context, index) {
            return _tile(
                theme: theme,
                categoryItem: categories[index],
                onTap: () {
                  if (categories[index].id == 9) {
                    print('${categories[index].title} is tapped');
                  } else {
                    print('${categories[index].title} is tapped');
                    GoRouter.of(context)
                        .pushNamed(Screens.category, extra: categories[index]);
                  }
                });
          }),
    );
  }

  Widget _tile(
      {required ThemeData theme,
      required CategoryItem categoryItem,
      void Function()? onTap}) {
    return Material(
      color: theme.colorScheme.primary,
      borderRadius: BorderRadius.circular(AppSize.defaultRadius.sp),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSize.defaultRadius.sp),
        overlayColor: WidgetStatePropertyAll(
            theme.colorScheme.onSurface.withOpacity(0.4)),
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(2.sp, 2.sp, 2.sp, 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withOpacity(0.9),
                    borderRadius:
                        BorderRadius.circular(AppSize.defaultRadius.sp),
                  ),
                  child: Center(
                    child: Icon(
                      categoryItem.iconData,
                      // color: theme.colorScheme.surface,
                      size: 50.sp,
                    ),
                  ),
                ),
              ),
            ),
            Hero(
              tag: '${categoryItem.id}${categoryItem.title}',
              child: Text(
                categoryItem.title,
                style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSecondary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
