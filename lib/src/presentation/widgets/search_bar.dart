import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSearchSubmitted;
  const SearchBar({
    required this.onSearchSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onFieldSubmitted: onSearchSubmitted,
        decoration: const InputDecoration(
          hintText: "Search plants...",
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
