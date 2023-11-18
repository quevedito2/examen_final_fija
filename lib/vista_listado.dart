import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as df;
import 'package:drift/native.dart';
import 'package:examen_final_fija/database/database.dart';

class VistaListado extends StatefulWidget {
  const VistaListado({Key? key}) : super(key: key);

  @override
  _VistaListadoState createState() => _VistaListadoState();
}

class _VistaListadoState extends State<VistaListado> {
  @override
  Widget build(BuildContext context) {
    final database = AppDataBases(NativeDatabase.memory());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Listado de Post"),
        ),
        body: FutureBuilder<List<PosteoData>>(
          future: database.getListadoPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PosteoData> postList = snapshot.data!;

              return ListView.builder(
                itemCount: postList!.length,
                itemBuilder: (context, index) {
                  PosteoData postData = postList[index];
                  return ListTile(
                    title: //Text(snapshot.data![index].title),
                    Text(postData.title),
                    subtitle: //Text(snapshot.data![index].Body),
                    Text(postData.Body),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: Text('No hay datos'),                
              );
            }
          },
        ));
  }
}
