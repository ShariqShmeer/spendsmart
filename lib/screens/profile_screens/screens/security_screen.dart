import 'package:flutter/material.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      roundedBodyPercentage: 75,
      appBar: AppBar(
        title: Text('Security'),
      ),
      topWidget: SizedBox(),
      roundedBodyWidget: Center(child: Text('Security')),
    );
  }
}
