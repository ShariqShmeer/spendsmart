import 'package:flutter/material.dart';
import 'package:spendsmart/models/category_models/category_item.dart';
import 'package:spendsmart/widgets/balance_overview_widget.dart';
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
        centerTitle: true,
      ),
      topWidget: Center(
        child: BalanceOverView(
          totalAmount: balance,
          expenseAmount: expense,
        ),
      ),
      roundedBodyWidget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Details'),
            Text('id :${widget.categoryItem.id}'),
            Text('title : ${widget.categoryItem.title}'),
            Icon(widget.categoryItem.iconData),
          ],
        ),
      ),
    );
  }
}
