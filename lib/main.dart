import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design System',
        // Aqui chamamos a função que retorna o ThemeData com tokens
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Design System')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          QLabel(
            text: 'Texto de Exemplo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            semanticsLabel: 'Label semântico',
            semanticsIdentifier: 'Identificador semântico',
          )
            
          ],
        ),
      ),
    );
  }
}
