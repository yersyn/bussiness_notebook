import 'package:bussiness_notebook/domain/models/theme.dart';
import 'package:equatable/equatable.dart';

abstract class PreferenceEvent extends Equatable{
}

class LoadPreferences extends PreferenceEvent{
  @override
  List<Object> get props => [];
}

class UpdateTheme extends PreferenceEvent{
  final Theme theme;

  UpdateTheme(this.theme);

  @override
  List<Object> get props => [theme];

  @override
  String toString()=>"$runtimeType {$theme}";

}

