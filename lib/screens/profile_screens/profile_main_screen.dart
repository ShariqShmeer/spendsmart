import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendsmart/res/app_screens.dart';
import 'package:spendsmart/screens/profile_screens/widgets/profile_widget.dart';
import 'package:spendsmart/utils/extensions/integer_extensions.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';
import 'package:spendsmart/widgets/custom_tile_widget.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  double tileHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      roundedBodyPercentage: 75,
      topWidget: ProfileWidget(
        name: 'Muhammad Shariq Shmeer',
        email: 'shariqshmeer@gmail.com',
        number: '03043455791',
        onTap: () {
          print('Edit Picture tapped');
        },
      ),
      roundedBodyWidget: Column(
        children: [
          10.hSpace,
          CustomTileWidget(
            leading: Icon(Icons.person),
            title: 'Edit Profile',
            onTap: () {
              GoRouter.of(context).pushNamed(Screens.editProfile);
            },
          ),
          CustomTileWidget(
            leading: Icon(Icons.security),
            title: 'Security',
            onTap: () {
              GoRouter.of(context).pushNamed(Screens.security);
            },
          ),
          CustomTileWidget(
            leading: Icon(Icons.settings),
            title: 'Settings',
            onTap: () {
              GoRouter.of(context).pushNamed(Screens.setting);
            },
          ),
          CustomTileWidget(
            leading: Icon(Icons.logout_outlined),
            title: 'Logout',
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                // Dismiss the dialog and do nothing
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: th,
              // ),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                // Perform logout action
                GoRouter.of(context).goNamed(Screens.auth);
              },
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
}
