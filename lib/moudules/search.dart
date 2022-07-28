import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search must not be empty';
                      }
                    },
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Search'),
                        prefixIcon: Icon(Icons.search))),
              ),
              Expanded(child: articleBuilder(list, context,isSearch: true)),
            ],
          ),
        );

      }
    );
  }
}
