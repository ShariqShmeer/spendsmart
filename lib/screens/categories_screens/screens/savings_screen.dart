import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/models/category_models/saving_category_items.dart';
import 'package:spendsmart/res/app_icons.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/res/app_size.dart';
import 'package:spendsmart/widgets/custom_icon.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  final List<SavingCategoryItems> savingCategories = [
    SavingCategoryItems(
      id: 1,
      iconId: AppIcons.travelIcon,
      title: 'Travelling',
      amount: 50000,
      savedAmount: 2000,
    ),
    SavingCategoryItems(
      id: 2,
      iconId: AppIcons.house1Icon,
      title: 'New House',
      amount: 53000,
      savedAmount: 20000,
    ),
    SavingCategoryItems(
      id: 3,
      iconId: AppIcons.carFrontIcon,
      title: 'Car',
      amount: 5340000,
      savedAmount: 500000,
    ),
    SavingCategoryItems(
      id: 4,
      iconId: Icons.movie_outlined.codePoint.toString(),
      title: 'Movies',
      amount: 10000,
      savedAmount: 8000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      backgroundColor: theme.appBarTheme.backgroundColor,
      roundedBodyPercentage: 90,
      appBar: AppBar(
        title: Text('Savings'),
      ),
      topWidget: SizedBox(),
      roundedBodyWidget: GridView.builder(
          padding: EdgeInsets.fromLTRB(
              AppSize.defaultPadding + 5.h,
              AppSize.defaultPadding + 5.h,
              AppSize.defaultPadding + 5.h,
              AppSize.defaultBottomNavHeight + 5.h),
          itemCount: savingCategories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: AppSize.defaultPadding.h,
            crossAxisSpacing: AppSize.defaultPadding.h,
            childAspectRatio: 0.90,
          ),
          itemBuilder: (context, index) {
            return _tile(
                theme: theme,
                savingCategoryItems: savingCategories[index],
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    Screens.savingCategory,
                    extra: savingCategories[index],
                  );
                });
          }),
    );
  }

  Widget _tile({
    required ThemeData theme,
    required SavingCategoryItems savingCategoryItems,
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
                      tag:
                          '${savingCategoryItems.id}${savingCategoryItems.iconId}',
                      child: CustomIcon(
                        size: 50.sp,
                        customIcons: AppIcons.getIconById(
                            iconId: savingCategoryItems.iconId),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Hero(
              tag: '${savingCategoryItems.id}${savingCategoryItems.title}',
              child: Text(
                savingCategoryItems.title,
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
