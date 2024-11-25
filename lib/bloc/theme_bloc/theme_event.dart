part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeTheme extends ThemeEvent {
  final ThemeMode themeMode;

  const ChangeTheme({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];
}
