import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final String title;
  final String route;
  const CustomElevatedButton({ Key? key,
    required this.title, required this.route}): super(key: key);

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                )
            ),
            backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(233, 241, 245, 1.0)
            ),
            foregroundColor: MaterialStateProperty.all(Color.fromRGBO(30, 111, 165, 1.0))
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.route);
        },
        child: Text(widget.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 20),)
    );
  }
}


