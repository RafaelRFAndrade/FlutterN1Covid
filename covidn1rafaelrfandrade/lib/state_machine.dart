import 'state.dart';

class StateMachine {
  bool showChoice2 = true;
  final List<State> _states = [
    State(
      text: 'Há falha na proteção ou manutenção da via aérea?',
      choice1: 'Sim',
      choice2: 'Não',
    ),
    State(
      text: 'Há falha na oxigenação ou ventilação?',
      choice1: 'Sim',
      choice2: 'Não',
    ),
    State(
      text: 'Candidato à ventilação não invasiva por pressão positiva?',
      choice1: 'Sim',
      choice2: 'Não',
    ),
    State(
      text: 'Sucesso?',
      choice1: 'Sim',
      choice2: 'Não',
    ),
    State(
      text: 'A evolução clínica esperada requer intubação?',
      choice1: 'Sim',
      choice2: 'Não',
    ),
    State(
      text: 'Observar.',
      choice1: 'Reiniciar',
      choice2: null,
    ),
    State(
      text: 'Intubar.',
      choice1: 'Reiniciar',
      choice2: null,
    ),
  ];

  int _currentStateIndex = 0;

  State getCurrentState() {
    final state = _states[_currentStateIndex];
    return state;
  }
  

  void nextState(int choice) {
    if (_currentStateIndex == 0) {
      if (choice == 1) {
        _currentStateIndex = 6; 
      } else if (choice == 2) {
        _currentStateIndex++; 
      }
    } else if (_currentStateIndex == 1) {
      if (choice == 1) {
        _currentStateIndex++; 
      } else if (choice == 2) {
        _currentStateIndex = 4; 
      }
    } else if (_currentStateIndex == 2) {
      if (choice == 1) {
        _currentStateIndex++; 
      } else if (choice == 2) {
        _currentStateIndex = 6; 
      }
    } else if (_currentStateIndex == 3) {
      if (choice == 1) {
        _currentStateIndex = 5; 
      } else if (choice == 2) {
        _currentStateIndex = 6; 
      }
    } else if (_currentStateIndex == 4) {
      if (choice == 1) {
        _currentStateIndex = 6; 
      } else if (choice == 2) {
        _currentStateIndex = 5; 
      }
    } else if(_currentStateIndex == 5) {
      if (choice == 1){
         reset();
      }
    } else if(_currentStateIndex == 6) {
      if (choice == 1){
         reset();
      }
    }
  }

  void reset(){
    _currentStateIndex = 0;
  }

}
