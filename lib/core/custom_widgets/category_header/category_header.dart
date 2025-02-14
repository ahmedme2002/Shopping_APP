import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';

class CategoryHeader extends StatefulWidget {
  final String title;
  final String count;
  final VoidCallback onSeeAllPressed;
  const CategoryHeader({
    super.key,
    required this.title,
    required this.count,
    required this.onSeeAllPressed,
  });
  @override
  State<CategoryHeader> createState() => _CategoryHeaderState();
}

class _CategoryHeaderState extends State<CategoryHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: pp16b,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${widget.count}",
              style: TextStyle(
                fontSize: font_14Size,
                fontWeight: FontWeight.w600,
                color: AllColors.grey,
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: widget.onSeeAllPressed,
          child: Text(
            "See All",
            style: pp14b,
          ),
        )
      ],
    );
  }
}
