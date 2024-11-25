import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/res/app_size.dart';
import 'package:spendsmart/utils/extensions/integer_extensions.dart';

class BalanceOverView extends StatelessWidget {
  final double totalAmount;
  final String totalAmountTitle;
  final Widget totalAmountIcon;
  final double amount;
  final String amountTitle;
  final Widget amountIcon;
  final bool isExpense;
  final bool totalAmountIsExpense;

  const BalanceOverView({
    super.key,
    required this.totalAmount,
    required this.amount,
    required this.isExpense,
    required this.totalAmountTitle,
    required this.totalAmountIcon,
    required this.amountTitle,
    required this.amountIcon,
    this.totalAmountIsExpense = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(AppSize.defaultPadding.sp),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.defaultPadding.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: _amountDisplay(
                    icon: totalAmountIcon,
                    title: totalAmountTitle,
                    amount: totalAmount,
                    isExpense: totalAmountIsExpense,
                    context: context,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 2.sp,
                      height: 60.sp,
                      child: ColoredBox(color: theme.colorScheme.shadow),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: _amountDisplay(
                    icon: amountIcon,
                    title: amountTitle,
                    amount: amount,
                    isExpense: isExpense,
                    context: context,
                  ),
                )
              ],
            ),
          ),
          AnimatedProgressBar(
            totalAmount: totalAmount,
            amount: amount,
          ),
        ],
      ),
    );
  }

  Widget _amountDisplay({
    required Widget icon,
    required String title,
    required double amount,
    bool isExpense = false,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon,
            5.wSpace,
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Text(
          '${isExpense ? '-' : ''}${_formatCurrency(amount)}',
          style: theme.textTheme.headlineMedium,
        )
      ],
    );
  }

  String _formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }
}

class AnimatedProgressBar extends StatelessWidget {
  final double totalAmount;
  final double amount;

  const AnimatedProgressBar({
    super.key,
    required this.totalAmount,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    assert(totalAmount > 0, 'Total amount must be greater than zero');
    assert(amount >= 0, 'Amount cannot be negative');

    final percentage = (amount / totalAmount).clamp(0.0, 1.0);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: percentage),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50.sp,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSecondary,
                borderRadius:
                    BorderRadius.circular(AppSize.defaultBtnRadius.sp),
              ),
              child: Stack(
                children: [
                  // Progress Bar
                  FractionallySizedBox(
                    widthFactor: value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _getProgressColor(value * 100),
                        borderRadius:
                            BorderRadius.circular(AppSize.defaultBtnRadius.sp),
                      ),
                    ),
                  ),
                  // Percentage Text
                  Center(
                    child: Text(
                      '${(value * 100).toStringAsFixed(1)}%',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            10.hSpace,
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: _getProgressColor(value * 100),
                ),
                8.wSpace,
                Expanded(
                  child: Text(
                    '${(value * 100).toStringAsFixed(2)}% Of Your Expenses, ${(value * 100) < 50 ? 'Looks Good.' : 'Watch Your Spending.'}',
                    style: TextStyle(
                      color: _getProgressColor(value * 100),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Color _getProgressColor(double percentage) {
    if (percentage < 30) return Colors.green;
    if (percentage < 70) return Colors.orange;
    return Colors.red;
  }
}
