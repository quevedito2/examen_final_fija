import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:examen_final_fija/api/Post.dart';

class Service {
  static Future<Post> getPost() async {
    final respuesta = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
    if (respuesta.statusCode == 200) {
      return Post.fromJson(json.decode(respuesta.body));
    } else {
      throw Exception("Error de conexion");
    }
  }

  static Future<Post> queryPost(String id) async {
    final respuesta = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/${id}"));
    if (respuesta.statusCode == 200) {
      return Post.fromJson(json.decode(respuesta.body));
    } else {
      throw Exception("Error de conexion");
    }
  }
}
