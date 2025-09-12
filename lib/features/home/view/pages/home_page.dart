import 'package:flutter/material.dart';
import 'package:zomato_ui/features/home/view/widgets/category_tab_bar.dart';
import 'package:zomato_ui/features/home/view/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  const SizedBox(width: 10),
                  Expanded(child: const SearchField()),
                ],
              ),
            ),
            Expanded(child: CategoryTabBar()),
          ],
        ),
      ),
    );
  }
}
