import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.onSubmitted});
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: const InputDecoration(
        hintText: 'search',
        suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
