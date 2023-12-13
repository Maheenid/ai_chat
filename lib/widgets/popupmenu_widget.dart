import 'package:ai_chat/screens/view_details_screen.dart';
import 'package:flutter/material.dart';

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: const Color(0xff343338),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: const Row(
            children: [
              Icon(
                Icons.info_outline,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'View Details',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const ViewDetailsScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
