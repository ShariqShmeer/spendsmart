import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/models/category_models/category_item.dart';
import 'package:spendsmart/res/app_icons.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/res/app_size.dart';
import 'package:spendsmart/screens/categories_screens/categories_main_screen.dart';
import 'package:spendsmart/widgets/balance_overview_widget.dart';
import 'package:spendsmart/widgets/custom_icon.dart';
import 'package:spendsmart/widgets/custom_image_icon.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryItem categoryItem;

  const CategoryScreen({super.key, required this.categoryItem});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  double expense = 3400;
  double balance = 5897;

  @override
  Widget build(BuildContext context) {
    print(widget.categoryItem.toJson());
    return CustomScaffold(
      roundedBodyPercentage: 75,
      appBar: AppBar(
        title: Hero(
            tag: '${widget.categoryItem.id}${widget.categoryItem.title}',
            child: Text(widget.categoryItem.title)),
      ),
      topWidget: Center(
        child: BalanceOverView(
          totalAmount: globalExpense,
          amount: widget.categoryItem.amount,
          totalAmountIsExpense: true,
          isExpense: true,
          totalAmountTitle: 'Total Expense',
          totalAmountIcon: CustomImageIcon(
            imgPath: AppIcons.expenseIcon,
            size: 18.sp,
          ),
          amountIcon: Hero(
              tag: '${widget.categoryItem.id}${widget.categoryItem.iconId}',
              child: CustomIcon(
                size: 22.sp,
                customIcons:
                    AppIcons.getIconById(iconId: widget.categoryItem.iconId),
              )),
          amountTitle: '${widget.categoryItem.title} Expense',
        ),
      ),
      roundedBodyWidget: Stack(
        alignment: Alignment.center,
        children: [
          ListView.builder(
              padding: EdgeInsets.fromLTRB(
                  0, 0, 0, (AppSize.defaultBottomNavHeight + 50).sp),
              itemCount: 30,
              itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text('Title ${index + 1}'),
                    ),
                  )),
          Positioned(
            bottom: AppSize.defaultBottomNavHeight.sp,
            child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(Screens.addCategoryAmount);
              },
              child: const Text('Add Expenses'),
            ),
          ),
        ],
      ),
    );
  }
}
