class State {
  final String _text;
  final String _choice1;
  final String? _choice2;

  State({
    required String text,
    required String choice1,
    String? choice2,
  })   : _text = text,
        _choice1 = choice1,
        _choice2 = choice2;

  String getText() {
    return _text;
  }

  String getChoice1() {
    return _choice1;
  }

  String? getChoice2() {
    return _choice2;
  }
}
