import 'package:demo/src/stateless.dart';
import 'package:flutter/material.dart';

class Statefull extends StatefulWidget {
  const Statefull({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StatefullState createState() => _StatefullState();
}

class _StatefullState extends State<Statefull> {
  final TextEditingController _textEditingController = TextEditingController();
  String name = "Not input";
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
