import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            body: Padding(
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Text(
                      'Chose your Favorite News',
                      style:
                          Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 28),
                    ),
                    cubit.buildSingleCheckBox(
                        checkBoxState: cubit.businessCheckBox,
                        function: (value) =>
                            cubit.changeBusinessCheckBoxState(value)),
                    cubit.buildSingleCheckBox(
                        checkBoxState: cubit.entertainmentCheckBox,
                        function: (value) =>
                            cubit.changeEntertainmentCheckBoxState(value)),
                    cubit.buildSingleCheckBox(
                        checkBoxState: cubit.generalCheckBox,
                        function: (value) =>
                            cubit.changeGeneralCheckBoxState(value)),
                    cubit.buildSingleCheckBox(
                        checkBoxState: cubit.healthCheckBox,
                        function: (value) =>
                            cubit.changeHealthCheckBoxState(value)),
                    cubit.buildSingleCheckBox(
                        checkBoxState: cubit.scienceCheckBox,
                        function: (value) =>
                            cubit.changeScienceCheckBoxState(value)),
                    cubit.buildSingleCheckBox(
                        checkBoxState: cubit.sportsCheckBox,
                        function: (value) =>
                            cubit.changeSportsCheckBoxState(value)),
                    cubit.buildSingleCheckBox(
                        checkBoxState: cubit.technologyCheckBox,
                        function: (value) =>
                            cubit.changeTechnologyCheckBoxState(value)),
                  ],
                )),
          );
        });
  }
}
