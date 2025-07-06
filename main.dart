import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F1512),

      ),
      home: const InteractiveDemo(),
    );
  }
}

class InteractiveDemo extends StatefulWidget {
  const InteractiveDemo({super.key});

  @override
  State<InteractiveDemo> createState() => _InteractiveDemoState();
}

class _InteractiveDemoState extends State<InteractiveDemo> {
  int _counter = 0;
  bool _showWidget = false;
  final List<bool> _taskCompleted = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Interactive Demo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Counter',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text('Tap the button to increment the counter.'),
                const SizedBox(height: 10),
                Text('Count: $_counter', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _counter++;
                      });
                    },
                    child: const Text('Increment'),
                  ),
                ),
                const SizedBox(height: 30),

                const Text(
                  'Toggle Visibility',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text('Toggle the visibility of the widget below.'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Show Widget'),
                    Switch(
                      value: _showWidget,
                      onChanged: (value) {
                        setState(() {
                          _showWidget = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (_showWidget)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://cdn.midjourney.com/90d5edfa-4aa6-44da-9505-c2b29139d871/0_2.png',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 30),

                const Text(
                  'Task List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text('Mark tasks as completed by checking the boxes.'),
                const SizedBox(height: 10),
                ...List.generate(_taskCompleted.length, (index) {
                  final tasks = ['Buy groceries', 'Finish report', 'Call mom'];
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Task ${index + 1}: ${tasks[index]}'),
                    value: _taskCompleted[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _taskCompleted[index] = value!;
                      });
                    },
                  );
                }),
              ],
            ),
        ),
    );
  }
