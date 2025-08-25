import 'package:demo/src/change%20lifecycle/a.dart';
import 'package:flutter/material.dart';

class B extends StatefulWidget {
  const B({super.key});

  @override
  _BState createState(){
    print("Screen B - createState");
    return _BState();
  }
}

class _BState extends State<B> {
  @override
  void initState() {
    super.initState();
    print("Screen B - initState");
  }

  
  @override
  void deactivate() {
    super.deactivate();
    print("screen B - deactivate");
  }

  @override
  void dispose() {
    print("Screen B - dispose");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen B - didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("Screen B - build");
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (context) => const A()),
            );
          },
          child: Text("Move to A"),
        ),
      ),
    );
  }
}
