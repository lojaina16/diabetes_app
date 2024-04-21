import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/theme_on_context.dart';
import 'package:flutter/material.dart';

class DropdownAddress extends StatelessWidget {
  final String hint;
  final String? changeHint;
  final Function(String?)? onChanged;

  const DropdownAddress({
    super.key,
    required this.items,
    required this.hint,
    this.changeHint,
    this.onChanged,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        elevation: 0,
        enableFeedback: true,
        padding: EdgeInsets.zero,
        value: changeHint,
        style: TextStyle(color: context.theme.textTheme.bodyMedium?.color),
        hint: Text(
          changeHint ?? hint,
          style: TextStyle(color: context.theme.textTheme.bodyMedium?.color),
        ),
        decoration: InputDecoration(
          constraints: BoxConstraints(minHeight: context.height * 0.06),
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: (value) {
          if (changeHint == null) {
            return "You Must Fill This Field ";
          }
          return null;
        },
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: context.theme.textTheme.bodyMedium?.color,
        ),
        isExpanded: true,
        items: items.map<DropdownMenuItem<String>>((String? value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              '$value',
              style: TextStyle(
                  fontSize: 18,
                  color: context.theme.textTheme.bodyMedium?.color),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
