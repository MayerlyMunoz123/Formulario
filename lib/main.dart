import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(child:Formulario() ,),
          ),
        ),
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  bool isMasculino = false;
  bool isFemenino = false;
  bool isOtros = false;
  String isSelected = "";

  void _handleCheckboxChange(bool? value, String gender) {
    setState(() {
      if (gender == 'Masculino') {
        isMasculino = value!;
        if (isMasculino) {
          isFemenino = false;
          isOtros = false;
        }
      } else if (gender == 'Femenino') {
        isFemenino = value!;
        if (isFemenino) {
          isMasculino = false;
          isOtros = false;
        }
      } else if (gender == 'Otros') {
        isOtros = value!;
        if (isOtros) {
          isMasculino = false;
          isFemenino = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Form"),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Cedula'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su cédula';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nombres'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese sus nombres';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Apellidos'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese sus apellidos';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Fecha de Nacimiento'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su fecha de nacimiento';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Edad'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su edad';
              }
              if (int.tryParse(value) == null) {
                return 'Por favor ingrese un número válido';
              }
              return null;
            },
          ),
          const Text("Genero"),
          Row(
            children: [
              const Text('Masculino'),
              Checkbox(
                value: isMasculino,
                onChanged: (bool? value) {
                  _handleCheckboxChange(value, 'Masculino');
                },
              ),
              const Text('Femenino'),
              Checkbox(
                value: isFemenino,
                onChanged: (bool? value) {
                  _handleCheckboxChange(value, 'Femenino');
                },
              ),
              const Text('Otros'),
              Checkbox(
                value: isOtros,
                onChanged: (bool? value) {
                  _handleCheckboxChange(value, 'Otros');
                },
              ),
            ],
          ),
          const Text("Estado Civil"),
          RadioListTile<String>(
            title: const Text('Casado'),
            value: 'opcion1',
            groupValue: isSelected,
            onChanged: (value) {
              setState(() {
                isSelected = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Soltero'),
            value: 'opcion2',
            groupValue: isSelected,
            onChanged: (value) {
              setState(() {
                isSelected = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Viudo'),
            value: 'opcion3',
            groupValue: isSelected,
            onChanged: (value) {
              setState(() {
                isSelected = value!;
              });
            },
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[TextButton(onPressed: (){if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Procesando datos')),
                    );
                  }}, child: const Text("Siguiente")),TextButton(onPressed: (){}, child: const Text("salir"))])

        ],
      ),
    );
  }
}
