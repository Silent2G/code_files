import 'package:flutter/material.dart';

class ScrollWrap extends StatelessWidget {
  final Widget child;

  ScrollWrap({this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: child,
              ));
        });
  }
}
