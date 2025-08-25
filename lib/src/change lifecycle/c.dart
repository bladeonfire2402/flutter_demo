import 'package:flutter/material.dart';

class C extends StatefulWidget {
  const C({super.key});

  @override
  _CState createState() {
    print("Screen C - Create State");
    return _CState();
  }
}

class _CState extends State<C> {
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Screen C - deactivated");
  }

  @override
  void dispose() {
    print("Screen C - dispose");
    super.dispose();
  }

   @override
  void initState() {
    super.initState();
    print("Screen C - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen C - didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("Screen C - build");
    return Container(child: Text("C widget"));
  }
}
