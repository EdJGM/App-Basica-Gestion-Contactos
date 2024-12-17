import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelo/persona_modelo.dart';

class PersonaControlador {
  static const String URL = 'http://localhost:5000/api/personas';

  static Future<List<Persona>> obtenerPersonas() async {
    final respuesta = await http.get(Uri.parse(URL));

    if (respuesta.statusCode == 200) {
      final List<dynamic> lista = jsonDecode(respuesta.body);
      return lista.map((e) => Persona.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener personas');
    }
  }

  static Future<Persona> crearPersona(Persona persona) async {
    final respuesta = await http.post(
      Uri.parse(URL),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': persona.nombre,
        'apellido': persona.apellido,
        'telefono': persona.telefono,
      }),
    );

    if (respuesta.statusCode == 201) {
      return Persona.fromJson(jsonDecode(respuesta.body));
    } else {
      throw Exception('Error al crear persona');
    }
  }

  static Future<Persona> actualizarPersona(String id, Persona persona) async {
    final respuesta = await http.put(
      Uri.parse('$URL/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': persona.nombre,
        'apellido': persona.apellido,
        'telefono': persona.telefono,
      }),
    );

    if (respuesta.statusCode == 200) {
      return Persona.fromJson(jsonDecode(respuesta.body));
    } else {
      throw Exception('Error al actualizar persona');
    }
  }

  static Future<void> eliminarPersona(String id) async {
    final respuesta = await http.delete(Uri.parse('$URL/$id'));

    if (respuesta.statusCode != 200) {
      throw Exception('Error al eliminar persona');
    }
  }
}