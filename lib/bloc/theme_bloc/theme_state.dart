part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeState(this.themeMode);
}

class UpdateTheme extends ThemeState {
  final ThemeMode updateTheme;
  const UpdateTheme(this.updateTheme) : super(updateTheme);
  @override
  List<Object?> get props => [updateTheme];
}
