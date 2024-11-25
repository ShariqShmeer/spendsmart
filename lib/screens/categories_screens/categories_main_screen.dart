import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/models/category_models/category_item.dart';
import 'package:spendsmart/res/app_icons.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/res/app_size.dart';
import 'package:spendsmart/widgets/balance_overview_widget.dart';
import 'package:spendsmart/widgets/custom_icon.dart';
import 'package:spendsmart/widgets/custom_image_icon.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class CategoriesMainScreen extends StatefulWidget {
  const CategoriesMainScreen({super.key});

  @override
  State<CategoriesMainScreen> createState() => _CategoriesMainScreenState();
}

double globalExpense = 0;

class _CategoriesMainScreenState extends State<CategoriesMainScreen> {
  double expense = 0;
  double balance = 65897;

  final List<CategoryItem> categories = [
    CategoryItem(
      id: 1,
      iconId: Icons.savings_outlined.codePoint.toString(),
      title: 'Savings',
      categoryType: CategoryType.expense,
      amount: 0,
    ),
    // Savings
    CategoryItem(
      id: 2,
      iconId: Icons.directions_bus_outlined.codePoint.toString(),
      title: 'Transport',
      categoryType: CategoryType.expense,
      amount: 4323.3,
    ),
    // Transport
    CategoryItem(
      id: 3,
      iconId: Icons.local_hospital_outlined.codePoint.toString(),
      title: 'Medicine',
      categoryType: CategoryType.expense,
      amount: 3675,
    ),
    // Medicine
    CategoryItem(
      id: 4,
      iconId: Icons.shopping_cart_outlined.codePoint.toString(),
      title: 'Groceries',
      categoryType: CategoryType.expense,
      amount: 653,
    ),
    // Groceries
    CategoryItem(
      id: 5,
      iconId: Icons.home_outlined.codePoint.toString(),
      title: 'Rent',
      categoryType: CategoryType.expense,
      amount: 9123,
    ),
    // Rent
    CategoryItem(
      id: 6,
      iconId: Icons.card_giftcard_outlined.codePoint.toString(),
      title: 'Gifts',
      categoryType: CategoryType.expense,
      amount: 2343,
    ),
    // Gifts
    CategoryItem(
      id: 7,
      iconId: Icons.fastfood_outlined.codePoint.toString(),
      title: 'Food',
      amount: 123.3,
      categoryType: CategoryType.expense,
    ),
    // Food
    CategoryItem(
      id: 8,
      iconId: Icons.movie_outlined.codePoint.toString(),
      title: 'Entertainment',
      categoryType: CategoryType.expense,
      amount: 6543,
    ),
    // Entertainment
    CategoryItem(
      id: 9,
      iconId: Icons.add.codePoint.toString(),
      title: 'More',
      categoryType: CategoryType.expense,
      amount: 0,
    ),

    // More
  ];

  @override
  void initState() {
    sumExpense();
    super.initState();
  }

  void sumExpense() {
    expense =
        categories.fold(0.0, (total, category) => total + category.amount);
    globalExpense = expense;
    setState(() {});
    print(expense);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      roundedBodyPercentage: 75,
      topWidget: Center(
        child: BalanceOverView(
          isExpense: true,
          totalAmount: balance,
          amount: expense,
          totalAmountTitle: 'Total Balance',
          totalAmountIcon: const Icon(Icons.account_balance_wallet_outlined),
          amountIcon: CustomImageIcon(
            imgPath: AppIcons.expenseIcon,
            size: 18.sp,
          ),
          amountTitle: 'Total Expense',
        ),
      ),
      roundedBodyWidget: GridView.builder(
          padding: EdgeInsets.fromLTRB(
              AppSize.defaultPadding + 5.h,
              AppSize.defaultPadding + 5.h,
              AppSize.defaultPadding + 5.h,
              AppSize.defaultBottomNavHeight + 5.h),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: AppSize.defaultPadding.h,
            crossAxisSpacing: AppSize.defaultPadding.h,
            childAspectRatio: 0.90,
          ),
          itemBuilder: (context, index) {
            return _tile(
              theme: theme,
              categoryItem: categories[index],
              onTap: () {
                if (index == 0) {
                  print('${categories[index].title} is tapped');
                  GoRouter.of(context).pushNamed(Screens.savings);
                } else if (index == categories.length - 1) {
                  if ((categories.length + 1) < AppIcons.getNumberOfIcons) {
                    CustomIcons icons = AppIcons.getIcons[index + 1];
                    categories.insert(
                      categories.length - 1,
                      CategoryItem(
                        id: index + 1,
                        iconId: icons.id,
                        title: 'Add new',
                        categoryType: CategoryType.expense,
                        amount: 1000 + Random().nextDouble() * 10000,
                      ),
                    );
                    balance += 1000 + Random().nextDouble() * 10000;
                    sumExpense();
                  }
                  print('${categories[index].title} is tapped');
                } else {
                  print('${categories[index].title} is tapped');
                  GoRouter.of(context)
                      .pushNamed(Screens.category, extra: categories[index]);
                }
              },
              onLongPress: () {
                if (index == 0) {
                  print('${categories[index].title} is tapped');
                } else if (index == categories.length - 1) {
                  print('${categories[index].title} is tapped');
                } else {
                  print('${categories[index].title} is tapped');
                  expense -= categories[index].amount;
                  categories.removeAt(index);
                  sumExpense();
                }
              },
            );
          }),
    );
  }

  Widget _tile({
    required ThemeData theme,
    required CategoryItem categoryItem,
    void Function()? onTap,
    void Function()? onLongPress,
  }) {
    return Material(
      color: theme.colorScheme.primary,
      borderRadius: BorderRadius.circular((AppSize.defaultRadius + 2).sp),
      child: InkWell(
        borderRadius: BorderRadius.circular((AppSize.defaultRadius + 2).sp),
        overlayColor: WidgetStatePropertyAll(
            theme.colorScheme.onSurface.withOpacity(0.3)),
        onTap: onTap,
        onLongPress: onLongPress,
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
                    child: Hero(
                      tag: '${categoryItem.id}${categoryItem.iconId}',
                      child: CustomIcon(
                        size: 50.sp,
                        customIcons:
                            AppIcons.getIconById(iconId: categoryItem.iconId),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Hero(
              tag: '${categoryItem.id}${categoryItem.title}',
              child: Text(
                categoryItem.title,
                overflow: TextOverflow.ellipsis,
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
