import 'package:flutter/material.dart';
import 'package:weather_app_assignment/res/strings.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChanged;

  const SearchWidget({
    super.key,
    required this.textEditingController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onFieldSubmitted: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        hintText: Strings.searchWeatherOfTheCity,
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        filled: true,
      ),
    );
  }
}
