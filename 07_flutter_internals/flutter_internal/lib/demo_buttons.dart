import 'package:flutter/material.dart';

class Texto extends Text {
  const Texto(super.data, {super.key});

  @override
  StatelessElement createElement() {
    print('Texto CREATEELEMENT called');
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    print('Texto BUILD called');
    return super.build(context);
  }
}

class DemoButtons extends StatefulWidget {
  const DemoButtons({super.key});

  @override
  StatefulElement createElement() {
    print('DemoButtons CREATEELEMENT called');
    return super.createElement();
  }

  @override
  State<DemoButtons> createState() => _DemoButtonsState();
}

class _DemoButtonsState extends State<DemoButtons> {
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    print('DemoButtons BUILD called');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = false;
                });
              },
              child: const Texto('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = true;
                });
              },
              child: const Texto('Yes'),
            ),
          ],
        ),
        if (_isUnderstood) const Texto('Awesome!'),
      ],
    );
  }
}
