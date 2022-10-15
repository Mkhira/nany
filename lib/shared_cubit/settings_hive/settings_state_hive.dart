part of 'settings_cubit_hive.dart';

@immutable
abstract class SettingsHiveState {}

class SettingsInitial extends SettingsHiveState {}

class SettingsLoading extends SettingsHiveState {}

class Redraw extends SettingsHiveState {}

class SettingsLoaded extends SettingsHiveState {
  final AppSettings appSettings;

  SettingsLoaded(this.appSettings);
}
