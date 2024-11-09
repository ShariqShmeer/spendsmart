import 'package:flutter/material.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      roundedBodyPercentage: 80,
      topWidget: SizedBox(),
      roundedBodyWidget: SizedBox(),
    );
  }
}
