import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/moudules/categories.dart';
import 'package:news_app/moudules/headlines_screen.dart';
import 'package:news_app/moudules/settings_screen.dart';
import 'package:news_app/moudules/sources.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/components/checkboxstate.dart';
import 'package:news_app/shared/network/remote/api_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  CheckBoxState generalCheckBox = CheckBoxState(title: "general");
  CheckBoxState businessCheckBox = CheckBoxState(title: "business");
  CheckBoxState entertainmentCheckBox = CheckBoxState(title: "entertainment");
  CheckBoxState healthCheckBox = CheckBoxState(title: "health");
  CheckBoxState scienceCheckBox = CheckBoxState(title: "science");
  CheckBoxState sportsCheckBox = CheckBoxState(title: "sports");
  CheckBoxState technologyCheckBox = CheckBoxState(title: "technology");

  Map category = {};

  void changeGeneralCheckBoxState(bool value) {
    generalCheckBox.value = value;
    category.addAll(generalCheckBox.toJson());
    emit(ChangeGeneralCheckBoxState());
    print(category);
  }
  void changeBusinessCheckBoxState(bool value) {
    businessCheckBox.value = value;
    category.addAll(businessCheckBox.toJson());
    emit(ChangeBusinessCheckBoxState());
  }

  void changeSportsCheckBoxState(bool value) {
    sportsCheckBox.value = value;
    category.addAll(sportsCheckBox.toJson());
    emit(ChangeSportsCheckBoxState());
  }

  void changeHealthCheckBoxState(bool value) {
    healthCheckBox.value = value;
    category.addAll(healthCheckBox.toJson());
    emit(ChangeHealthCheckBoxState());
  }

  void changeScienceCheckBoxState(bool value) {
    scienceCheckBox.value = value;
    category.addAll(scienceCheckBox.toJson());
    emit(ChangeScienceCheckBoxState());
  }

  void changeEntertainmentCheckBoxState(bool value) {
    entertainmentCheckBox.value = value;
    category.addAll(entertainmentCheckBox.toJson());
    emit(ChangeEntertainmentCheckBoxState());
  }

  void changeTechnologyCheckBoxState(bool value) {
    technologyCheckBox.value = value;
    category.addAll(technologyCheckBox.toJson());
    emit(ChangeTechnologyCheckBoxState());
  }

  Widget buildSingleCheckBox({
    required CheckBoxState checkBoxState,
    required void function(bool value),
    BuildContext? context,
  }) =>
      CheckboxListTile(
          value: checkBoxState.value,
          onChanged: (value) {
            function(value!);
          },
          activeColor: Colors.deepOrange,
          title: Text(checkBoxState.title));

  int currentIndex = 0;
  List<Widget> screens = [
    TopHeadLines(),
    SourcesScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.language), label: "HeadLines"),
    BottomNavigationBarItem(icon: Icon(Icons.api), label: "Sources"),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<dynamic> topHeadLines = [];

  void getTopHeadLines() {
    emit(NewsGetTopHeadLinesLoadingState());
    DioHelper.getData(url:'v2/top-headlines', query: {
      'country': 'ae',
      'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
    }).then((value) {
      topHeadLines = value.data['articles'];
      emit(NewsGetTopHeadLinesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetTopHeadLinesErrorState(error.toString()));
    });
  }

  List<dynamic> sources = [];

  void getSources() {
    emit(NewsGetSourcesLoadingState());
    DioHelper.getData(url:'v2/top-headlines/sources', query: {
      'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
    }).then((value) {
      sources = value.data['sources'];
      emit(NewsGetSourcesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSourcesErrorState(error.toString()));
    });
  }

  List<dynamic> general = [];

  void getGeneral() {
    emit(NewsGetGeneralLoadingState());
    DioHelper.getData(url:'v2/top-headlines', query: {
      'country': 'ae',
      'category': 'general',
      'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
    }).then((value) {
      general = value.data['articles'];
      emit(NewsGetGeneralSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetGeneralErrorState(error.toString()));
    });
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url:'v2/top-headlines', query: {
      'country': 'ae',
      'category': 'business',
      'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sport = [];

  void getSport() {
    emit(NewsGetSportLoadingState());
    if (sport.length == 0) {
      DioHelper.getData(url:'v2/top-headlines', query: {
        'country': 'ae',
        'category': 'sport',
        'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
      }).then((value) {
        sport = value.data['articles'];
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url:'v2/top-headlines', query: {
        'country': 'ae',
        'category': 'science',
        'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
      }).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> health = [];

  void getHealth() {
    emit(NewsGetHealthLoadingState());
    if (health.length == 0) {
      DioHelper.getData(url:'v2/top-headlines', query: {
        'country': 'ae',
        'category': 'health',
        'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
      }).then((value) {
        health = value.data['articles'];
        emit(NewsGetHealthSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetHealthErrorState(error.toString()));
      });
    } else {
      emit(NewsGetEntertainmentSuccessState());
    }
  }

  List<dynamic> entertainment = [];

  void getEntertainment() {
    emit(NewsGetEntertainmentLoadingState());
    if (entertainment.length == 0) {
      DioHelper.getData(url:'v2/top-headlines', query: {
        'country': 'ae',
        'category': 'entertainment',
        'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
      }).then((value) {
        entertainment = value.data['articles'];
        emit(NewsGetEntertainmentSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetEntertainmentErrorState(error.toString()));
      });
    } else {
      emit(NewsGetEntertainmentSuccessState());
    }
  }

  List<dynamic> technology = [];

  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());
    if (technology.length == 0) {
      DioHelper.getData(url:'v2/top-headlines', query: {
        'country': 'ae',
        'category': 'technology',
        'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
      }).then((value) {
        technology = value.data['articles'];
        emit(NewsGetTechnologySuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetTechnologyErrorState(error.toString()));
      });
    } else {
      emit(NewsGetTechnologySuccessState());
    }
  }





  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(url: 'https://newsapi.org/v2/everything', query: {
      'q': '$value',
      'apiKey': '753c05ba8a1e4a949aa1b3ee9f4a1763',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
