import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Business',
      'Technology',
      'Career',
      'Education',
      'Finance',
    ];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 8,
              right: index == categories.length - 1 ? 16 : 0,
            ),
            child: FilterChip(
              label: Text(categories[index]),
              selected: index == 0,
              onSelected: (selected) {
                // TODO: Implement filter logic
              },
            ),
          );
        },
      ),
    );
  }
}