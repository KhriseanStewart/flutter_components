import 'package:denbigh_app/users/database/lists.dart';
import 'package:denbigh_app/utils/validators_%20and_widgets.dart';
import 'package:flutter/material.dart';

class LocationAutoComplete extends StatefulWidget {
  final Function(String?) onCategorySelected;
  final bool? underlineBorder;
  const LocationAutoComplete({Key? key, required this.onCategorySelected, this.underlineBorder})
    : super(key: key);

  @override
  _LocationAutoCompleteState createState() => _LocationAutoCompleteState();
}

class _LocationAutoCompleteState extends State<LocationAutoComplete> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return jamaicaParishesWithTowns.where((String category) {
          return category.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          );
        });
      },
      onSelected: (String selection) {
        widget.onCategorySelected(selection);
      },
      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController controller,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextFormField(
              controller: controller,
              focusNode: focusNode,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Enter Location",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.location_on, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: widget.underlineBorder == true
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      )
                    : null, 
              ),
              validator: validateNotEmpty,
            );
          },
    );
  }
}
