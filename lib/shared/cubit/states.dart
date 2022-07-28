abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class ChangeBottomNavState extends NewsStates {}

class ChangeGeneralCheckBoxState extends NewsStates {}

class ChangeBusinessCheckBoxState extends NewsStates {}

class ChangeEntertainmentCheckBoxState extends NewsStates {}

class ChangeHealthCheckBoxState extends NewsStates {}

class ChangeScienceCheckBoxState extends NewsStates {}

class ChangeSportsCheckBoxState extends NewsStates {}

class ChangeTechnologyCheckBoxState extends NewsStates {}

class NewsGetTopHeadLinesLoadingState extends NewsStates {}

class NewsGetTopHeadLinesSuccessState extends NewsStates {}

class NewsGetTopHeadLinesErrorState extends NewsStates {
  final String error;

  NewsGetTopHeadLinesErrorState(this.error);
}
class NewsGetHealthLoadingState extends NewsStates {}

class NewsGetHealthSuccessState extends NewsStates {}

class NewsGetHealthErrorState extends NewsStates {
  final String error;

  NewsGetHealthErrorState(this.error);
}
class NewsGetEntertainmentLoadingState extends NewsStates {}

class NewsGetEntertainmentSuccessState extends NewsStates {}

class NewsGetEntertainmentErrorState extends NewsStates {
  final String error;

  NewsGetEntertainmentErrorState(this.error);
}
class NewsGetTechnologyLoadingState extends NewsStates {}

class NewsGetTechnologySuccessState extends NewsStates {}

class NewsGetTechnologyErrorState extends NewsStates {
  final String error;

  NewsGetTechnologyErrorState(this.error);
}


class NewsGetSourcesLoadingState extends NewsStates {}

class NewsGetSourcesSuccessState extends NewsStates {}

class NewsGetSourcesErrorState extends NewsStates {
  final String error;

  NewsGetSourcesErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetGeneralSuccessState extends NewsStates {}

class NewsGetGeneralErrorState extends NewsStates {
  final String error;

  NewsGetGeneralErrorState(this.error);
}

class NewsGetGeneralLoadingState extends NewsStates {}

class NewsGetSportSuccessState extends NewsStates {}

class NewsGetSportErrorState extends NewsStates {
  final String error;

  NewsGetSportErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String error;

  NewsGetSearchErrorState(this.error);
}
