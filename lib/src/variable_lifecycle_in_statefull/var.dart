import 'package:demo/src/variable_lifecycle_in_statefull/l.dart';
import 'package:flutter/material.dart';

class Var extends StatefulWidget {
  const Var({super.key});

  @override
  _VarState createState() => _VarState();
}

class _VarState extends State<Var> {
  int _my = 1;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState $_my");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
    print(_textEditingController);
    print("dispose $_my");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies $_my");
  }

  @override
  void didUpdateWidget(covariant Var oldWidget) {
    // TODO: implement didUpdateWidget
    print("didUpdateWidget $_my");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("Build $_my");
    return Scaffold(
      appBar: AppBar(title: Text("Variable change inside")),
      body: Column(
        children: [
          Container(child: Text(_my.toString())),
          L(number: _my),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _my++;
              });
            },
            child: Text("+1"),
          ),
        ],
      ),
    );
  }
}
