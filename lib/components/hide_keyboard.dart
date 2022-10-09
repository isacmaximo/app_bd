import 'package:flutter/material.dart';

class HideKeyboardWrapper extends StatelessWidget {
  final FocusScopeNode currentFocus;
  final Widget? child;

  const HideKeyboardWrapper({
    Key? key,
    required this.child,
    required this.currentFocus,
  }) : super(key: key);

  void hideKeyboard(FocusScopeNode currentFocus) {
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(currentFocus),
      child: child,
    );
  }
}
