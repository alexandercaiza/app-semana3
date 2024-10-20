import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'page/Nosotros.dart';
import 'page/Contacto.dart';
import 'page/Formulario.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Negocio de lectura rápida'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Contacto'),
              onTap: () {
                //NAVEGAR A CONTACTO
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Contacto()));
              },
            ),
            ListTile(
              title: Text('Nosotros'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Nosotros()));
              },
            ),
            ListTile(
              title: Text('Formulario de registro'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Formulario()));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
          children: <Widget>[
            Icon(
              Icons.star, // Ícono
              size: 50, // Tamaño del ícono
              color: Colors.blue, // Color del ícono
            ),
            SizedBox(height: 16), // Espacio entre el ícono y el texto
            Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 24, // Tamaño del texto
                fontWeight: FontWeight.bold, // Negrita
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
