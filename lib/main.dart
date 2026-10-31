import 'package:flutter/material.dart';

void main() {
  runApp(const TaskFlowApp());
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int pendingTasks = 3;

  void addTask() {
    setState(() {
      pendingTasks++;
    });
  }

  void completeTask() {
    if (pendingTasks == 0) return;
    setState(() {
      pendingTasks--;
    });
  }

  @override
  Widget build(BuildContext context) {
    const String appName = 'TaskFlow';
    const String studentName = 'Shirley';
    const String motivationalMessage =
        'Un paso a la vez: hoy es un buen día para avanzar.';

    return Scaffold(
      appBar: AppBar(title: const Text(appName)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Hola, $studentName!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            const Text(motivationalMessage),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.checklist_rounded, size: 40),
                    const SizedBox(width: 16),
                    const Expanded(child: Text('Tareas pendientes')),
                    Text(
                      '$pendingTasks',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: addTask,
                  child: const Text('Agregar tarea'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: completeTask,
                  child: const Text('Completar tarea'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}