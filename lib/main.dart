import 'package:flutter/material.dart';
import 'appstate.dart';  // файл с InheritedWidget
import 'getsetup.dart'; // файл с GetIt

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _inheritedData = "изначальные данные";

  void _updateInheritedData(String newData) {
    setState(() {
      _inheritedData = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      data: _inheritedData,
      updateData: _updateInheritedData,
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _inheritedController = TextEditingController();
  final TextEditingController _getItController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final inheritedData = AppState.of(context)?.data;
    final updateInheritedData = AppState.of(context)?.updateData;
    final getItService = getIt<AppService>();

    return Scaffold(
      appBar: AppBar(title: const Text("project_nine")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("InheritedWidget: $inheritedData"),
            TextField(
              controller: _inheritedController,
              decoration: const InputDecoration(labelText: "введите данные, которые обновятся с помощью InheritedWidget"),
            ),
            ElevatedButton(
              onPressed: () {
                if (updateInheritedData != null) {
                  updateInheritedData(_inheritedController.text);
                }
              },
              child: const Text("обновить"),
            ),
            const SizedBox(height: 20),
            Text("GetIt: ${getItService.data}"),
            TextField(
              controller: _getItController,
              decoration: const InputDecoration(labelText: "введите данные, которые обновятся с помощью GetIt"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  getItService.data = _getItController.text;
                });
              },
              child: const Text("обновить"),
            ),
          ],
        ),
      ),
    );
  }
}
