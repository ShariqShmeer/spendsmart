import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/models/category_models/saving_category_items.dart';
import 'package:spendsmart/res/app_icons.dart';
import 'package:spendsmart/res/app_size.dart';
import 'package:spendsmart/widgets/custom_icon.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class SavingCategoryScreen extends StatefulWidget {
  final SavingCategoryItems savingCategoryItems;
  const SavingCategoryScreen({super.key, required this.savingCategoryItems});

  @override
  State<SavingCategoryScreen> createState() => _SavingCategoryScreenState();
}

class _SavingCategoryScreenState extends State<SavingCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      roundedBodyPercentage: 75,
      appBar: AppBar(
        title: Hero(
            tag:
                '${widget.savingCategoryItems.id}${widget.savingCategoryItems.title}',
            child: Text(widget.savingCategoryItems.title)),
      ),
      topWidget: _header(),
      roundedBodyWidget: const SizedBox(),
    );
  }

  Widget _header() {
    final percentage = (widget.savingCategoryItems.savedAmount /
            widget.savingCategoryItems.amount)
        .clamp(0.0, 1.0);
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.defaultPadding.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Goal',
                  style: theme.textTheme.bodyMedium,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Text(
                    _formatCurrency(widget.savingCategoryItems.amount),
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                Text(
                  'Saved Amount',
                  style: theme.textTheme.bodyMedium,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Text(
                    _formatCurrency(widget.savingCategoryItems.savedAmount),
                    style: theme.textTheme.displayMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20.h),
          padding: EdgeInsets.all(10.h),
          height: 170.h,
          width: 170.h,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(AppSize.defaultRadius.r),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: percentage,
                      strokeWidth: 6.sp,
                      strokeAlign: 6.sp,
                      strokeCap: StrokeCap.round,
                      backgroundColor: theme.colorScheme.onSecondary,
                    ),
                    Hero(
                        tag:
                            '${widget.savingCategoryItems.id}${widget.savingCategoryItems.iconId}',
                        child: CustomIcon(
                          size: 40.sp,
                          customIcons: AppIcons.getIconById(
                              iconId: widget.savingCategoryItems.iconId),
                        ))
                  ],
                ),
              ),
              Text(widget.savingCategoryItems.title),
              Text('(${(percentage * 100).toStringAsFixed(2)}%)'),
            ],
          ),
        )
      ],
    );
  }

  String _formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }
}
