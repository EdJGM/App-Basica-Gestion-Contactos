import 'package:flutter/material.dart';
import '../modelo/persona_modelo.dart';
import '../controlador/persona_controlador.dart';

class PersonaVista extends StatefulWidget {
  @override
  _PersonaVistaState createState() => _PersonaVistaState();
}

class _PersonaVistaState extends State<PersonaVista> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _apellido = '';
  String _telefono = '';
  List<Persona> _personas = [];

  @override
  void initState() {
    super.initState();
    _cargarPersonas();
  }

  Future<void> _cargarPersonas() async {
    try {
      final personas = await PersonaControlador.obtenerPersonas();
      setState(() {
        _personas = personas;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _crearPersona() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final nuevaPersona = Persona(id: '', nombre: _nombre, apellido: _apellido, telefono: _telefono);
      try {
        await PersonaControlador.crearPersona(nuevaPersona);
        _cargarPersonas();
      } catch (e) {
        // Handle error
      }
    }
  }

  Future<void> _actualizarPersona(String id) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final personaActualizada = Persona(id: id, nombre: _nombre, apellido: _apellido, telefono: _telefono);
      try {
        await PersonaControlador.actualizarPersona(id, personaActualizada);
        _cargarPersonas();
      } catch (e) {
        // Handle error
      }
    }
  }

  Future<void> _eliminarPersona(String id) async {
    try {
      await PersonaControlador.eliminarPersona(id);
      _cargarPersonas();
    } catch (e) {
      // Handle error
    }
  }

  void _mostrarDialogoCrearPersona() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Crear Nueva Persona'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    icon: Icon(Icons.person),
                  ),
                  onSaved: (value) => _nombre = value!,
                  validator: (value) => value!.isEmpty ? 'Ingrese un nombre' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Apellido',
                    icon: Icon(Icons.person_outline),
                  ),
                  onSaved: (value) => _apellido = value!,
                  validator: (value) => value!.isEmpty ? 'Ingrese un apellido' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Teléfono',
                    icon: Icon(Icons.phone),
                  ),
                  onSaved: (value) => _telefono = value!,
                  validator: (value) => value!.isEmpty ? 'Ingrese un teléfono' : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _crearPersona();
                Navigator.of(context).pop();
              },
              child: Text('Crear'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDialogoActualizarPersona(Persona persona) {
    _nombre = persona.nombre;
    _apellido = persona.apellido;
    _telefono = persona.telefono;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Actualizar Persona'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: _nombre,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    icon: Icon(Icons.person),
                  ),
                  onSaved: (value) => _nombre = value!,
                  validator: (value) => value!.isEmpty ? 'Ingrese un nombre' : null,
                ),
                TextFormField(
                  initialValue: _apellido,
                  decoration: InputDecoration(
                    labelText: 'Apellido',
                    icon: Icon(Icons.person_outline),
                  ),
                  onSaved: (value) => _apellido = value!,
                  validator: (value) => value!.isEmpty ? 'Ingrese un apellido' : null,
                ),
                TextFormField(
                  initialValue: _telefono,
                  decoration: InputDecoration(
                    labelText: 'Teléfono',
                    icon: Icon(Icons.phone),
                  ),
                  onSaved: (value) => _telefono = value!,
                  validator: (value) => value!.isEmpty ? 'Ingrese un teléfono' : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _actualizarPersona(persona.id);
                Navigator.of(context).pop();
              },
              child: Text('Actualizar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Contactos', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _mostrarDialogoCrearPersona,
              child: Text('Agregar Nueva Persona', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _personas.length,
                itemBuilder: (context, index) {
                  final persona = _personas[index];
                  return Card(
                    child: ListTile(
                      title: Text('${persona.nombre} ${persona.apellido}'),
                      subtitle: Text(persona.telefono),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _mostrarDialogoActualizarPersona(persona),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _eliminarPersona(persona.id),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}