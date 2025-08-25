import 'package:demo/src/change%20lifecycle/a.dart';
import 'package:demo/src/intl/intel.dart';
import 'package:demo/src/manage_app_cycle/manage_app_cycle.dart';
import 'package:demo/src/statefull.dart';
import 'package:demo/src/variable_lifecycle_in_statefull/var.dart';
import 'package:flutter/material.dart';

navigatePage(BuildContext context, Widget location) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(builder: (context) => location),
  );
}

class DemoSwitch extends StatelessWidget {
  const DemoSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Demo App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                navigatePage(context, Statefull());
              },
              child: const Text("Demo statefull and stateless"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, A());
              },
              child: const Text("Demo about lifecycle of widgets"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, Var());
              },
              child: const Text("Demo about varibles"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, Intel());
              },
              child: const Text("Demo about internationalizing"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, AppLifecycleListenerExample());
              },
              child: const Text("Demo about manage LifeCycle"),
            ),
          ],
        ),
      ),
    );
  }
}
