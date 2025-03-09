import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE0F2FF),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF0D47A1),
          title: Text('Profil',
          style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Foto(),
              Nama(),
              Web(),
              SizedBox(height: 20),
              ButtonsRow(
                buttons: [
                  ButtonData(Icons.my_location, 'Singaraja', Colors.green),
                  ButtonData(Icons.store, 'Badung', Colors.amber),
                ],
              ),
              ButtonsRow(
                buttons: [
                  ButtonData(Icons.music_note, 'KPOP, JPOP', Colors.deepPurple),
                  ButtonData(Icons.business, 'Undiksha', Colors.blueAccent),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Foto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: CircleAvatar(
        radius: 75,
        backgroundImage: AssetImage('lib/assets/DSC05580.jpg'),
      ),
    );
  }
}

class Nama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        'Ni Putu Ayu Kusuma Dewi',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

class Web extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Text(
        'https://tinyurl.com/ayukadw1018',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  final List<ButtonData> buttons;

  ButtonsRow({required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons
          .map((data) => Expanded(child: _buildButton(data)))
          .toList()
          .expand((widget) => [widget, SizedBox(width: 70)]) // Menambah jarak horizontal
          .toList()
          ..removeLast(),

        // children: buttons.map((data) => _buildButton(data)).toList(),
      ),
    );
  }

  Widget _buildButton(ButtonData data) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Icon(data.icon, size: 50, color: data.iconColor),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                // 
              ),
              child: Text(
                data.label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.yellow, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonData {
  final IconData icon;
  final String label;
  final Color iconColor;

  ButtonData(this.icon, this.label, this.iconColor);
}
