import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _addToExpression(String text) {
    setState(() {
      _expression += text;
    });
  }

  void _clearAll() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void _calculateResult() {
    Parser parser = Parser();
    Expression expression = parser.parse(_expression);
    ContextModel contextModel = ContextModel();
    double evalResult = expression.evaluate(EvaluationType.REAL, contextModel);

    setState(() {
      _result = evalResult.toStringAsFixed(2); // Show the result with 2 decimal places
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Divider(height: 1.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(18.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _result,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Divider(height: 1.0),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  CalculatorButton(
                    text: '7',
                    onPressed: () => _addToExpression('7'),
                  ),
                  CalculatorButton(
                    text: '8',
                    onPressed: () => _addToExpression('8'),
                  ),
                  CalculatorButton(
                    text: '9',
                    onPressed: () => _addToExpression('9'),
                  ),
                  CalculatorButton(
                    text: '/',
                    onPressed: () => _addToExpression('/'),
                  ),
                  CalculatorButton(
                    text: '4',
                    onPressed: () => _addToExpression('4'),
                  ),
                  CalculatorButton(
                    text: '5',
                    onPressed: () => _addToExpression('5'),
                  ),
                  CalculatorButton(
                    text: '6',
                    onPressed: () => _addToExpression('6'),
                  ),
                  CalculatorButton(
                    text: '*',
                    onPressed: () => _addToExpression('*'),
                  ),
                  CalculatorButton(
                    text: '1',
                    onPressed: () => _addToExpression('1'),
                  ),
                  CalculatorButton(
                    text: '2',
                    onPressed: () => _addToExpression('2'),
                  ),
                  CalculatorButton(
                    text: '3',
                    onPressed: () => _addToExpression('3'),
                  ),
                  CalculatorButton(
                    text: '-',
                    onPressed: () => _addToExpression('-'),
                  ),
                  CalculatorButton(
                    text: '0',
                    onPressed: () => _addToExpression('0'),
                  ),
                  CalculatorButton(
                    text: '.',
                    onPressed: () => _addToExpression('.'),
                  ),
                  CalculatorButton(
                    text: '(',
                    onPressed: () => _addToExpression('('),
                  ),
                  CalculatorButton(
                    text: ')',
                    onPressed: () => _addToExpression(')'),
                  ),
                  CalculatorButton(
                    text: '=',
                    onPressed: _calculateResult,
                  ),
                  CalculatorButton(
                    text: 'C',
                    onPressed: _clearAll,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CalculatorButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
