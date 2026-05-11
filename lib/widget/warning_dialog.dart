import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onYes;
  final VoidCallback? onNo;

  const WarningDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.onYes,
    this.onNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      title: Row(
        children: const [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange,
            size: 30,
          ),
          SizedBox(width: 10),
          Text(
            "Peringatan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            description,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);

            if (onNo != null) {
              onNo!();
            }
          },
          child: const Text("Batal"),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
          onPressed: () {
            Navigator.pop(context);
            onYes();
          },
          child: const Text("Ya"),
        ),
      ],
    );
  }
}