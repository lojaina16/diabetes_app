import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
class InstructionList extends StatelessWidget {
  const InstructionList({
    super.key,
    required this.instructions,
  });

  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: instructions.length,
      addRepaintBoundaries: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = instructions[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.4),
                      shape: BoxShape.circle),
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                width: 16,
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: context.width * 0.79),
                  child: Text(item,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold)))
            ],
          ),
        );
      },
    );
  }
}
