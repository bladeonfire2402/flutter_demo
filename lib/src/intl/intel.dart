import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class Intel extends StatefulWidget {
  const Intel({super.key});

  @override
  State<Intel> createState() => _IntelState();
}

class _IntelState extends State<Intel> {
  String locale = 'es';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("internationalization")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add the following code
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (locale == 'es') {
                    locale = 'vi';
                  } else {
                    locale = 'es';
                  }
                });
              },
              child: Text(locale),
            ),
            //Phương thức này tạm cho phép thay đổi ngôn ngữ
            Localizations.override(
              context: context,
              locale: Locale(locale),
              child: Builder(
                builder: (context) {
                  // A toy example for an internationalized Material widget.
                  return CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    onDateChanged: (value) {},
                  );
                },
              ),
            ),
            Localizations.override(
              context: context,
              locale: Locale(locale),
              child: Builder(
                builder: (context) {
                  return Column(
                    children: [
                       
                    ],
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
