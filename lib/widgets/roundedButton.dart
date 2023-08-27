import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String buttonTitle;
  final VoidCallback buttonOnPressed;
  const RoundedButton(
      {super.key,
      required this.color,
      required this.buttonTitle,
      required this.buttonOnPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: buttonOnPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonTitle,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
