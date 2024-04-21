import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:flutter/material.dart';

class RecordStatus extends StatelessWidget {
  final String text;
  final String? value;
  final String prefix;
  final Color color;
  final Function? onTap;
  const RecordStatus({
    super.key,
    required this.text,
    required this.value,
    required this.prefix,
    required this.color, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.43,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: const Color(0xff5f6583ff)),
      child: Column(
        children: [
          Center(
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.18,
                  width: context.width * 0.4,
                  child: CircularProgressIndicator(
                    color: color,
                    value: (double.parse(value ?? '100') / 100),
                  ),
                ),
                Text(
                  "$value $prefix",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff5063BF)),
                )
              ],
            ),
          ),
          if(onTap!=null)
          MyButton(text: "Change", onTap:onTap?? () {})
        ],
      ),
    );
  }
}
