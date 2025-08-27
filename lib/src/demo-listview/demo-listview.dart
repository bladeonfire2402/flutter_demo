import 'dart:async';

import 'package:demo/class/list-item.dart';
import 'package:flutter/material.dart';

class DemoListview extends StatefulWidget {
  const DemoListview({super.key});

  @override
  _DemoListviewState createState() => _DemoListviewState();
}

class _DemoListviewState extends State<DemoListview> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _des = TextEditingController();
  List<ListItem> list = [];
  StreamController strCtr = StreamController();

  void addToList(String name, String description) {
    if (_formKey.currentState!.validate()) {
      if (list.any((e) => e.name == name)) {
        return; // tồn tại rồi thì không thêm
      }

      setState(() {
        list.add(ListItem(name, description));
        _name.text = "";
        _des.text = "";
      });
    }
  }

  void removeFromList(String name) {
    setState(() {
      list.removeWhere((e) => e.name == name);
    });
  }

  @override
  void dispose() {
    _name.dispose();
    _des.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("ListView demo")),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                spacing: 10,
                children: [
                  TextFormField(
                    controller: _name,
                    validator: (value) {
                      {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập';
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Input name",
                      prefixIcon: Icon(Icons.nest_cam_wired_stand_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.brown,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _des,
                    validator: (value) {
                      {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập';
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "Input Description",
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.brown,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        addToList(_name.text, _des.text);
                      },
                      child: Text("Add to list"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.brown[50], // background
                      borderRadius: BorderRadius.circular(12), // bo góc
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(list[index].name),
                      subtitle: Text(list[index].description),
                      trailing: IconButton(
                        onPressed: () {
                          removeFromList(list[index].name);
                        },
                        icon: Icon(Icons.remove_circle),
                      ),
                      leading: Text((index + 1).toString(), style: TextStyle(
                        fontSize: 20,
                      ),),
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
