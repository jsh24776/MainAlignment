import 'package:flutter/material.dart';


const String lastName = 'Regidor';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 3 - Alignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// The three colored squares used in every example.
Widget box(Color color) => Container(width: 50, height: 50, color: color);

List<Widget> boxes() => [
      box(Colors.red),
      box(Colors.yellow),
      box(Colors.blue),
    ];


AppBar taskAppBar() => AppBar(
      backgroundColor: Colors.teal,
      centerTitle: true,
      title: const Text('TASK 3 - $lastName'),
    );

// ---------------------------------------------------------------
// HOME: 8 buttons, one for each screen in the PDF
// ---------------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _item(BuildContext context, String label, Widget page) {
    return ListTile(
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(),
      body: ListView(
        children: [
          _item(context, 'MainAxisAlignment.center',
              const RowDemo('MainAxisAlignment.center', MainAxisAlignment.center)),
          _item(context, 'MainAxisAlignment.spaceAround',
              const RowDemo('MainAxisAlignment.spaceAround',
                  MainAxisAlignment.spaceAround)),
          _item(context, 'MainAxisAlignment.spaceBetween',
              const RowDemo('MainAxisAlignment.spaceBetween',
                  MainAxisAlignment.spaceBetween)),
          _item(context, 'MainAxisAlignment.spaceEvenly',
              const RowDemo('MainAxisAlignment.spaceEvenly',
                  MainAxisAlignment.spaceEvenly)),
          _item(context, 'MainAxisAlignment.start',
              const RowDemo('MainAxisAlignment.start', MainAxisAlignment.start)),
          _item(context, 'MainAxisAlignment.end',
              const RowDemo('MainAxisAlignment.end', MainAxisAlignment.end)),
          _item(context, 'CrossAxisAlignment.start',
              const ColumnDemo('CrossAxisAlignment.start', CrossAxisAlignment.start)),
          _item(context, 'CrossAxisAlignment.center',
              const ColumnDemo('CrossAxisAlignment.center', CrossAxisAlignment.center)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------
// ROW demo: label on top, Row of 3 boxes below (MainAxisAlignment)
// ---------------------------------------------------------------
class RowDemo extends StatelessWidget {
  final String label;
  final MainAxisAlignment alignment;
  const RowDemo(this.label, this.alignment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity, // Row takes the full screen width
              child: Row(
                mainAxisAlignment: alignment,
                children: boxes(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------
// COLUMN demo: label + 3 boxes stacked (CrossAxisAlignment)
// ---------------------------------------------------------------
class ColumnDemo extends StatelessWidget {
  final String label;
  final CrossAxisAlignment alignment;
  const ColumnDemo(this.label, this.alignment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(),
      body: SizedBox(
        width: double.infinity, // Column takes the full screen width
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: alignment,
          children: [
            Text(label),
            const SizedBox(height: 16),
            ...boxes(),
          ],
        ),
      ),
    );
  }
}