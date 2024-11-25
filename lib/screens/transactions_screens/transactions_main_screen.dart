import 'package:flutter/material.dart';
import 'package:spendsmart/res/app_icons.dart';
import 'package:spendsmart/widgets/custom_icon.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class TransactionsMainScreen extends StatefulWidget {
  const TransactionsMainScreen({super.key});

  @override
  State<TransactionsMainScreen> createState() => _TransactionsMainScreenState();
}

class _TransactionsMainScreenState extends State<TransactionsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text('Transaction'),
      ),
      roundedBodyPercentage: 75,
      topWidget: SizedBox(),
      roundedBodyWidget: ListView.builder(
          itemCount: AppIcons.getIcons.length,
          itemBuilder: (context, index) {
            return Card(
                child: CustomIcon(customIcons: AppIcons.getIcons[index]));
          }),
    );
  }
}
