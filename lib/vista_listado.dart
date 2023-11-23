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

                  return Dismissible(
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      key: ValueKey<int>(postData.id),
                      onDismissed: (DismissDirection direction) async {
                        await database.deletePost(postData.id);
                        setState(() {
                          postList.removeAt(index);
                        });
                      },
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Text("Id " +
                                          postList[index].id.toString()),
                                      Text("UserId " +
                                          postList[index].userId.toString()),
                                      Text("Title " +
                                          postList[index].title.toString()),
                                      Text("Body " +
                                          postList[index].Body.toString()),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    showBottomSheet(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                        context: context,
                                        builder: (context) =>
                                            builSheet(postData, database));
                                  },
                                  child: Text("Edit")),
                            ],
                          ),
                        ),
                      ));
                  /* return ListTile(
                    title: //Text(snapshot.data![index].title),
                    Text(postData.title),
                    subtitle: //Text(snapshot.data![index].Body),
                    Text(postData.Body),
                  );
                  */
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

  Widget builSheet(PosteoData pos, AppDataBases database) => Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Id : ${pos.id}'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                initialValue: "${pos.userId}",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Ingrese el ID del post",
                  labelText: "ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                initialValue: "${pos.title}",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Ingrese titulo",
                  labelText: "ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                initialValue: "${pos.Body}",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Ingrese cuerpo",
                  labelText: "ID",
                ),
              ),
            ),
            /*TO - DO*/
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Guardar"),
            )
          ],
        ),
      );
}
