import 'package:flutter/material.dart';
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
        centerTitle: true,
      ),
      roundedBodyPercentage: 75,
      topWidget: SizedBox(),
      roundedBodyWidget: const Center(
        child: Text('Transaction Main Screen'),
      ),
    );
  }
}
