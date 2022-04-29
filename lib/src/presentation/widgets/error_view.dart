import 'package:flutter/cupertino.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback reloadCallback;
  const ErrorView({required this.reloadCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton.filled(
        child: const Text("RELOAD"),
        onPressed: reloadCallback,
      ),
    );
  }
}
