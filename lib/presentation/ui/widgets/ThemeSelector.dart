
import 'package:bussiness_notebook/domain/models/Theme.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceBloc.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceEvent.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceState.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: BlocBuilder<PreferenceBloc, PreferenceState>(
        builder: (context, state) {
          if (state is PreferenceLoaded) {
            return ListView.builder(
                itemCount: Theme.values.length,
                itemBuilder: (context, index) {
                  return RadioListTile<Theme>(
                      value: Theme.values[index],
                      groupValue: state.theme,
                      title: Text(_convertThemeToString(Theme.values[index])),
                      onChanged: (theme) {
                        BlocProvider.of<PreferenceBloc>(context)
                            .add(UpdateTheme(theme));
                      });
                });
          }
          return Container();
        },
      ),
    );
  }

  String _convertThemeToString(Theme theme) {
    switch (theme) {
      case Theme.light:
        return 'Light';
      case Theme.dark:
        return 'Dark';
    }
    return "Dark";
  }
}
