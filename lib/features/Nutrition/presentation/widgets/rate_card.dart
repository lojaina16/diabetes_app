import 'package:diabetes/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
class RateCard extends StatelessWidget {
  const RateCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Card(
          color: Theme.of(context).cardColor,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Rate this Recipe',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_right,
                  color: AppColors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
