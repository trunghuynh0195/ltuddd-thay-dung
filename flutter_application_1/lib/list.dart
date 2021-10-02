import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';

class DemoListView extends StatelessWidget {
  const DemoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataModel? dataModel = DataModel();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.line_style),
          title: const Text("Danh sach co ban"),
        ),
        body: ListView.builder(
            itemCount: dataModel.data.length - 1,
            itemBuilder: (_, index) {
              index = index + 1;
              return Card(
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange,
                  ),
                  title: Text(dataModel.data[index].name.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.delete_rounded),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
