import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendsmart/bloc/theme_bloc/theme_bloc.dart';
import 'package:spendsmart/screens/profile_screens/widgets/theme_toggle_widget.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';
import 'package:spendsmart/widgets/custom_tile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      roundedBodyPercentage: 75,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      topWidget: SizedBox(),
      roundedBodyWidget: Column(
        children: [
          _themeWidget(),
        ],
      ),
    );
  }

  Widget _themeWidget() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTileWidget(
              title: 'Theme',
              subTitle:
                  state.themeMode == ThemeMode.system ? 'System' : 'Custom',
              trailing: Switch.adaptive(
                activeColor: theme.colorScheme.primary,
                thumbColor: WidgetStatePropertyAll(theme.colorScheme.onSurface),
                value: state.themeMode == ThemeMode.system,
                onChanged: (bool? value) {
                  print(value);
                  if (value == true) {
                    context.read<ThemeBloc>().add(
                          const ChangeTheme(
                            themeMode: ThemeMode.system,
                          ),
                        );
                  } else {
                    final isDark =
                        Theme.of(context).brightness == Brightness.dark;
                    context.read<ThemeBloc>().add(
                          ChangeTheme(
                            themeMode:
                                isDark ? ThemeMode.dark : ThemeMode.light,
                          ),
                        );
                  }
                },
              ),
            ),
            if (state.themeMode != ThemeMode.system)
              CustomTileWidget(
                title: state.themeMode == ThemeMode.light
                    ? 'Light Mode'
                    : 'Dark Mode',
                trailing: const ThemeToggle(),
              )
          ],
        );
      },
    );
  }
}
