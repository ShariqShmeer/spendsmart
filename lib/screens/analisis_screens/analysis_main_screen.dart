import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spendsmart/widgets/balance_overview_widget.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class AnalysisMainScreen extends StatefulWidget {
  const AnalysisMainScreen({super.key});

  @override
  State<AnalysisMainScreen> createState() => _AnalysisMainScreenState();
}

class _AnalysisMainScreenState extends State<AnalysisMainScreen> {
  Timer? _timer;
  // @override
  // void initState() {
  //   super.initState();
  //   _startPeriodicTask();
  // }

  void _startPeriodicTask() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (expense <= 7783) {
          expense += expense;
        } else {
          expense = 500;
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
        centerTitle: true,
      ),
      roundedBodyPercentage: 75,
      topWidget: BalanceOverView(
        totalAmount: 7783,
        expenseAmount: expense,
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
