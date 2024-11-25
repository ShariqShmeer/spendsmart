import 'package:flutter/material.dart';
import 'package:spendsmart/res/app_size.dart';
import 'package:spendsmart/utils/extensions/integer_extensions.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hi, Welcome Back',
              style: theme.textTheme.displayMedium
                  ?.copyWith(color: theme.colorScheme.surface),
            ),
            Text(
              'Good Morning',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(color: theme.colorScheme.surface),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('notification icon tapped');
              },
              icon: const Icon(Icons.notifications_active))
        ],
      ),
      roundedBodyPercentage: 75,
      topWidget: SizedBox(),
      roundedBodyWidget: ListView(
        children: [
          ...List.generate(
              20,
              (index) => ListTile(
                    onTap: () {
                      print('List Number ${index + 1} Tapped');
                    },
                    title: Text('List Number ${index + 1}'),
                  )),
          AppSize.defaultBottomNavHeight.sphSpace,
        ],
      ),
    );
  }
}
