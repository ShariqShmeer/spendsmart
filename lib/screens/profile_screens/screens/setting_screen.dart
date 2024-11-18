import 'package:flutter/material.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      roundedBodyPercentage: 75,
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      topWidget: SizedBox(),
      roundedBodyWidget: Center(child: Text('Settings')),
    );
  }
}
