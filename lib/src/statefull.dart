import 'package:demo/src/stateless.dart';
import 'package:flutter/material.dart';

//Vòng đời của 1 statefull widget bao gồm
// + createState (khởi tạo state)
// + initState (khỏi động state)
// + didChangeDependencies 
// + build (render ra giao diện)
// + setState (thay đổi state)
// + didUpdateWidget
// + deactivate
// + dispose

class Statefull extends StatefulWidget {
  const Statefull({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StatefullState createState() => _StatefullState(); //createState
}

class _StatefullState extends State<Statefull> {
  final TextEditingController _textEditingController = TextEditingController();
  String name = "Not input";
  
  //chạy initState


  //chạy didChangeDependencies

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "This is the statefull Widget",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(name),
              SizedBox(height: 20),
              TextField(
                controller: _textEditingController,
                onChanged: (v) {
                  setState(() {
                    name = v;
                  });
                },
                decoration: InputDecoration(
                  label: Text("Name"),
                  hintText: "Input your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const Stateless(),
                      ),
                    );
                  },
                  child: Text(
                    "Move to Stateless",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
