import 'package:flutter/material.dart';
import 'package:examen_final_fija/api/Service.dart';
import 'package:examen_final_fija/api/Post.dart';

class VistaConsulta extends StatefulWidget {
  const VistaConsulta({Key? key}) : super(key: key);

  @override
  _VistaConsultaState createState() => _VistaConsultaState();
}

class _VistaConsultaState extends State<VistaConsulta> {
  late Future<Post> _futurePost;

  final TextEditingController txtId = TextEditingController();

  @override
  void initState() {
    _futurePost = Service.getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consulta de Post"),
      ),
      body: Container(
        child: FutureBuilder<Post>(
          future: _futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: txtId,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Ingrese el ID del post",
                        labelText: "ID",
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _futurePost = Service.queryPost(txtId.text);
                          });
                        },
                        child: Text("Consultar Post")),
                    Text("ID: " + snapshot.data!.id.toString()),
                    Text("Title: " + snapshot.data!.title.toString()),
                    Text("Body: " + snapshot.data!.body.toString()),
                  ],
                ),
              );
            } else {
              return Text("${snapshot.error}");
            }
          },
        ),
      ),
    );
  }
}
