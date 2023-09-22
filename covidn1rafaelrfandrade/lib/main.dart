import 'package:flutter/material.dart';
import 'state_machine.dart';

void main() {
  runApp(const CovidHelper());
}

class CovidHelper extends StatelessWidget {
  const CovidHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CovidHelperPage(),
          ),
        ),
      ),
    );
  }
}

class CovidHelperPage extends StatefulWidget {
  const CovidHelperPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CovidHelperPageState createState() => _CovidHelperPageState();
}

class _CovidHelperPageState extends State<CovidHelperPage> {
  final StateMachine stateMachine = StateMachine();

  void nextState(int choice) {
    setState(() {
      stateMachine.nextState(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentState = stateMachine.getCurrentState();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentState.getText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(16.0), 
                minimumSize: const Size(200, 100), 
              ),
              onPressed: () {
                nextState(1); 
              },
              child: Text(
                currentState.getChoice1(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: currentState.getChoice2() != null, 
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(16.0), 
              minimumSize: const Size(200, 100), 
            ),
              onPressed: () {
                nextState(2); 
              },
              child: Text(
                currentState.getChoice2() ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
