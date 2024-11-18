import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/res/app_size.dart';
import 'package:spendsmart/res/images.dart';
import 'package:spendsmart/utils/extensions/integer_extensions.dart';
import 'package:spendsmart/widgets/custom_image_icon.dart';

class BalanceOverView extends StatefulWidget {
  final double totalAmount;
  final double expenseAmount;

  const BalanceOverView({
    super.key,
    required this.totalAmount,
    required this.expenseAmount,
  });

  @override
  State<BalanceOverView> createState() => _BalanceOverViewState();
}

class _BalanceOverViewState extends State<BalanceOverView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expenseAnimation;
  double _previousExpense = 0; // Track previous expense amount

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    // Initialize animation in initState
    _expenseAnimation = Tween<double>(
      begin: 0,
      end: widget.expenseAmount,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _previousExpense = widget.expenseAmount;
    _controller.forward();
  }

  void _updateAnimation() {
    _expenseAnimation = Tween<double>(
      begin: _previousExpense,
      end: widget.expenseAmount,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _previousExpense = widget.expenseAmount;
    _controller.forward(from: 0);
  }

  @override
  void didUpdateWidget(BalanceOverView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expenseAmount != widget.expenseAmount ||
        oldWidget.totalAmount != widget.totalAmount) {
      _updateAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(1)}';
  }

  Color _getProgressColor(double percentage) {
    if (percentage < 30) return Colors.green;
    if (percentage < 70) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: _amountDisplay(
                      icon: Icon(Icons.account_balance_wallet_outlined),
                      title: 'Total Balance',
                      amount: widget.totalAmount),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                        width: 2.sp,
                        height: 50.sp,
                        child: ColoredBox(color: theme.colorScheme.shadow)),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: _amountDisplay(
                      icon: CustomImageIcon(
                        imgPath: Images.expenseIcon,
                        size: 18.sp,
                      ),
                      title: 'Total Expense',
                      amount: widget.expenseAmount,
                      isExpense: true),
                )
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final currentExpense = _expenseAnimation.value;
              final currentPercentage =
                  (currentExpense / widget.totalAmount * 100).clamp(0.0, 100.0);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20.h,
                    child: Stack(
                      children: [
                        // Background pill
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.all(2.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.colorScheme.onSecondary,
                                borderRadius: BorderRadius.circular(
                                    AppSize.defaultRadius.r),
                              ),
                            ),
                          ),
                        ),

                        // Progress bar
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.all(2.sp),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: currentPercentage / 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _getProgressColor(currentPercentage),
                                    borderRadius: BorderRadius.circular(
                                        AppSize.defaultRadius.r),
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 5.w),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Amount text
                        Positioned(
                          left: 10,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Text(
                              '${currentPercentage.toStringAsFixed(0)}%',
                            ),
                          ),
                        ),
                        // Amount text
                        Positioned(
                          right: 16,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Text(
                              _formatCurrency(widget.totalAmount),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  5.hSpace,
                  // Status message
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: _getProgressColor(currentPercentage),
                      ),
                      8.wSpace,
                      Expanded(
                        child: Text(
                          '${currentPercentage.toStringAsFixed(0)}% Of Your Expenses, ${currentPercentage < 50 ? 'Looks Good.' : 'Watch Your Spending.'}',
                          style: TextStyle(
                            color: _getProgressColor(currentPercentage),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _amountDisplay(
      {required Widget icon,
      required String title,
      required double amount,
      bool isExpense = false}) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon,
            5.wSpace,
            Text(
              title,
              style: theme.textTheme.titleMedium,
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
}
