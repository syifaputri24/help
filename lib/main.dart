import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HelpPage(),
    );
  }
}

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final List<String> _stopwatchInstructions = [
    'Tap the "Start" button to begin the stopwatch.',
    'Tap the "flag" button to laps the stopwatch',
    'Tap the "Pause" button to pause the stopwatch.',
    'Tap the "Reset" button to reset the stopwatch.',
  ];

  final List<String> _recommendations = [
    '1. Buka Halaman Rekomendasi.',
    '2. Pilih jam yang diinginkan.',
    '3. Klik ikon love untuk menambahkan ke halaman favorit.',
    '4. Ikon love pada jam favorit akan berwarna merah.',
    '5. Tekan ikon love untuk menghapus dari halaman favorit.',
  ];

  List<Widget> _buildInstructions() {
    return _stopwatchInstructions
        .map((instruction) => ListTile(
              leading: CircleAvatar(
                child:
                    Text('${_stopwatchInstructions.indexOf(instruction) + 1}'),
              ),
              title: Text(instruction),
            ))
        .toList();
  }

  List<Widget> _buildRecommendations() {
    return _recommendations
        .map((recommendation) => ListTile(
              title: Text(recommendation),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Help'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Stopwatch'),
              Tab(text: 'Favorit'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to use the Stopwatch:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Column(children: _buildInstructions()),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to Add to Favorit:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Column(children: _buildRecommendations()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
