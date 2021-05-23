import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<T> showTextDialog<T>(
    BuildContext context, {
      @required String title,
      @required String value,
    }) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String value;

  const TextDialogWidget({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.title),
    content: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    ),
    actions: [
      ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0)),
          elevation: MaterialStateProperty.all(5.0),
          alignment: Alignment.center,
          textStyle: MaterialStateProperty.all(GoogleFonts.raleway(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 15,
          ),),
          backgroundColor: MaterialStateProperty.all(Colors.black),
          shadowColor: MaterialStateProperty.all(Color(0x802196F3))
        ),
        child: Text('Done'),
        onPressed: () => Navigator.of(context).pop(controller.text),
      )
    ],
  );
}