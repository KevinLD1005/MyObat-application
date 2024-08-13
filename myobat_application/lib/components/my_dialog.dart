import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/theme/theme_provider.dart';

class MyDialog extends StatefulWidget {
  final String title;
  final String content;
  // final Widget? page;

  const MyDialog({
    Key? key,
    required this.title,
    required this.content,
    /*this.page*/
  }) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AlertDialog(
      backgroundColor: themeProvider.themeData.colorScheme.primary,
      title: Text(
        widget.title,
        style: TextStyle(
          color: themeProvider.themeData.colorScheme.secondary,
        ),
      ),
      content: Text(
        widget.content,
        style: TextStyle(
          color: themeProvider.themeData.colorScheme.secondary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }
}
