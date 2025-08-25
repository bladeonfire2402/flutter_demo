// ignore_for_file: avoid_print

import 'package:demo/src/change%20lifecycle/b.dart';
import 'package:demo/src/change%20lifecycle/c.dart';
import 'package:flutter/material.dart';

class A extends StatefulWidget {
  const A({super.key});

  @override
  _AState createState() {
    print("screen A - createState");
    return _AState();
  }
}

class _AState extends State<A> {
  @override
  void initState() {
    super.initState();
    print("screen A - initState");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("screen A - deactivate");
  }

  @override
  void dispose() {
    print("Screen A - dispose");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen A - didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant A oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Screen A - Update");
  }

  bool state = false;

  @override
  Widget build(BuildContext context) {
    print("Screen A - build");
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (context) => const B()),
                );
              },
              child: const Text("Move to b"),
            ),
          ),
          C(key: ValueKey(state)), // Dùng key không thay đổi
          ElevatedButton(
            onPressed: () {
              setState(() {
                state = !state;
              });
            },
            child: const Text("Deactivate "),
          ),
        ],
      ),
    );
  }
}
