import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/moudules/business.dart';
import 'package:news_app/moudules/entertainment_screen.dart';
import 'package:news_app/moudules/general.dart';
import 'package:news_app/moudules/science.dart';
import 'package:news_app/moudules/sport.dart';
import 'package:news_app/moudules/technology_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'health_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          var list = cubit.category.entries.map((e) => e.value).toList();
          var keyList = cubit.category.entries.map((e) => e.key).toList();
          return Scaffold(
            body: ListView.builder(
                itemCount: cubit.category.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => ConditionalBuilder(
                    condition: list[index] == true,
                    builder: (context) => Container(
                          height: 120,
                          padding: EdgeInsets.all(20),
                          child: ListTile(
                            onTap: () {
                              if (keyList[index] == 'general') {
                                cubit.getGeneral();
                                navigateTo(context, GeneralScreen());
                              } else if (keyList[index] == 'business') {
                                cubit.getBusiness();
                                navigateTo(context, BusinessScreen());
                              } else if (keyList[index] == 'science') {
                                cubit.getScience();
                                navigateTo(context, ScienceScreen());
                              } else if (keyList[index] == 'health') {
                                cubit.getHealth();
                                navigateTo(context, HealthScreen());
                              } else if (keyList[index] == 'sports') {
                                cubit.getSport();
                                navigateTo(context, SportScreen());
                              } else if (keyList[index] == 'technology') {
                                cubit.getTechnology();
                                navigateTo(context, TechnologyScreen());
                              } else {
                                cubit.getEntertainment();
                                navigateTo(context, EntertainmentScreen());
                              }
                            },
                            title: Text(
                              keyList[index].toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                    fallback: (context) => Center())),
          );
        });
  }
}
