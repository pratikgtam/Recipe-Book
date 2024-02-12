import 'package:flutter/material.dart';

class AppRoutes {
  final BuildContext context;

  AppRoutes(this.context);
  Future push(Widget? widget) async {
    if (widget == null) {
      return;
    }

    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  Future pushReplacement(Widget widget) async {
    return await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  Future pushAndRemoveUntil(Widget? widget) async {
    if (widget == null) {
      return;
    }
    return await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );
  }

  //pop until
  void popUntil() {
    Navigator.popUntil(
      context,
      (route) => route.isFirst,
    );
  }

  //pop
  void pop() {
    if (Navigator.canPop(context)) {
      return Navigator.pop(context);
    }
  }
}
