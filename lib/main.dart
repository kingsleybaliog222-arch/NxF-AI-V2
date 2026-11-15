import 'package:flutter/material.dart';

void main() {
  runApp(const NxFApp());
}

const purple = Color(0xFFAA55FF);
const bg = Color(0xFF050810);
const panel = Color(0xFF111A2B);

class NxFApp extends StatelessWidget {
  const NxFApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NxF AI V2',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bg,
        colorScheme: const ColorScheme.dark(
          primary: purple,
          surface: panel,
        ),
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selected = 0;

  final names = [
    'Home',
    'Script Editor',
    'Script AI',
    'Guardian AI',
    'History',
    'Settings'
  ];

  final icons = [
    Icons.home,
    Icons.code,
    Icons.smart_toy,
    Icons.shield,
    Icons.history,
    Icons.settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        title: const Text(
          'NxF AI V2',
          style: TextStyle(
            color: purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.circle,
                color: Colors.green, size: 12),
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: panel,
            selectedIndex: selected,
            onDestinationSelected: (i) {
              setState(() => selected = i);
            },
            labelType: NavigationRailLabelType.all,
            destinations: List.generate(
              names.length,
              (i) => NavigationRailDestination(
                icon: Icon(icons[i]),
                label: Text(names[i]),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: purple,
                      size: 75,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      names[selected],
                      style: const TextStyle(
                        fontSize: 26,
                        color: purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      selected == 0
                          ? 'Welcome to Nexus X Fantrick.'
                          : 'NxF ${names[selected]} module',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
