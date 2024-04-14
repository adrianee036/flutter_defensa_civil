import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final bool pass;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.pass
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF4F5FE),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: pass,
              style: TextStyle(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                    color: const Color(0xFF9499C0)),
                suffixIcon: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}