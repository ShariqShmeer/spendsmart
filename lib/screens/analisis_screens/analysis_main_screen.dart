import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/res/app_icons.dart';
import 'package:spendsmart/widgets/balance_overview_widget.dart';
import 'package:spendsmart/widgets/custom_image_icon.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class AnalysisMainScreen extends StatefulWidget {
  const AnalysisMainScreen({super.key});

  @override
  State<AnalysisMainScreen> createState() => _AnalysisMainScreenState();
}

class _AnalysisMainScreenState extends State<AnalysisMainScreen> {
  Timer? _timer;

  void _startPeriodicTask() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (expense <= 7783) {
          expense += 100;
        } else {
          expense = 100;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  double expense = 500;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text('Analysis'),
      ),
      roundedBodyPercentage: 75,
      topWidget: BalanceOverView(
        totalAmount: 7783,
        amount: expense,
        isExpense: true,
        totalAmountTitle: 'Total Balance',
        totalAmountIcon: const Icon(Icons.account_balance_wallet_outlined),
        amountIcon: CustomImageIcon(
          imgPath: AppIcons.expenseIcon,
          size: 18.sp,
        ),
        amountTitle: 'Total Expense',
      ),
      roundedBodyWidget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Analysis Main Screen $expense'),
            ElevatedButton(
                onPressed: () {
                  if (_timer?.isActive ?? false) {
                    _timer!.cancel();
                  } else {
                    _startPeriodicTask();
                  }
                },
                child: Text('Add')),
          ],
        ),
      ),
    );
  }
}
