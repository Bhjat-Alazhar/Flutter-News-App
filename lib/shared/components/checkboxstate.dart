class CheckBoxState {
  bool value;
  String title;

  CheckBoxState({this.value = false, required this.title});

  Map<String, dynamic> toJson() {
    return {
      title: value
    };
  }
}
