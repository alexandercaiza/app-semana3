import 'package:flutter/material.dart';

void _showDialog(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Registro'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Para ajustar el tamaño del diálogo
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un usuario';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Clave'),
                obscureText: true, // Para ocultar la clave
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una clave';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor ingresa un email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Celular'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un número de celular';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
            },
          ),
          TextButton(
            child: Text('Registrar'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Aquí puedes procesar los datos ingresados
                print('Usuario: ${usernameController.text}');
                print('Clave: ${passwordController.text}');
                print('Email: ${emailController.text}');
                print('Celular: ${phoneController.text}');
                Navigator.of(context).pop(); // Cierra el diálogo
              }
            },
          ),
        ],
      );
    },
  );
}

class Formulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: const Center(
        child: Text(
          '¡Página de formulario',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
