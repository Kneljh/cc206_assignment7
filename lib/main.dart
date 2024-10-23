import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  double result = 0;

  void add() {
    setState(() {
      result = double.parse(controller1.text) + double.parse(controller2.text);
    });
  }

  void subtract() {
    setState(() {
      result = double.parse(controller1.text) - double.parse(controller2.text);
    });
  }

  void multiply() {
    setState(() {
      result = double.parse(controller1.text) * double.parse(controller2.text);
    });
  }

  void divide() {
    setState(() {
      result = double.parse(controller1.text) / double.parse(controller2.text);
    });
  }

  void clear() {
    setState(() {
      controller1.clear();
      controller2.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 200,
                child: TextField(
                  controller: controller1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter first number',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: TextField(
                  controller: controller2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter second number',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.add),
                  onPressed: add,
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.minus),
                  onPressed: subtract,
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.multiply),
                  onPressed: multiply,
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.divide),
                  onPressed: divide,
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: clear,
              child: Text('Clear'),
            ),
            SizedBox(height: 20),
            Text(
              'Total: $result',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
