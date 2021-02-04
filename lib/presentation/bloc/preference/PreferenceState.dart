
import 'package:bussiness_notebook/domain/models/Theme.dart';
import 'package:equatable/equatable.dart';

abstract class PreferenceState extends Equatable{
}

class PreferenceNotLoaded extends PreferenceState{
  @override
  List<Object> get props => [];
}

class PreferenceLoaded extends PreferenceState{
  final Theme theme;

  PreferenceLoaded(this.theme);

  @override
  List<Object> get props => [theme];

  @override
  String toString() => "$runtimeType {$theme}";

}