import 'package:flutter/material.dart';

class SingleCarPage extends StatelessWidget {
  final int id;

  const SingleCarPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details'),
        backgroundColor: Colors.blue, // Change this to match your theme
      ),
      body: Column(
        children: [
          // Slideshow using PageView
          SizedBox(
            height: 250, // Adjust height as needed
            child: PageView(
              children: [
                Image.network(
                  'https://bydzone.uz/wp-content/uploads/2024/02/byd-han-exterior-03-20-min.png',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://bydzone.uz/wp-content/uploads/2024/02/byd-han-exterior-15-13-min.png',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://bydzone.uz/wp-content/uploads/2024/02/byd-han-exterior-15-14-min.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          // Spacer or Divider
          const SizedBox(height: 16),
          // Text content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Car Model',
                ),
                const SizedBox(height: 8),
                Text(
                  'This is a great car with many features including...',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  'More details about the car...',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
