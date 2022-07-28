import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/moudules/search.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/themeCubit/themeCubit.dart';

class NewsHomeLayout extends StatelessWidget {
  const NewsHomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          var newsCubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: Icon(Icons.brightness_4_outlined),
                    onPressed: () {
                      ChangeModeCubit.get(context).changeThemeMode();
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: newsCubit.bottomItem,
              currentIndex: newsCubit.currentIndex,
              onTap: (index) {
                newsCubit.changeBottomNavBar(index);
              },
            ),
            body: newsCubit.screens[newsCubit.currentIndex],
          );
        });
  }
}
