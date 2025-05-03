import 'package:flutter/material.dart';
import 'question_step_3.dart';

class QuestionStep2 extends StatefulWidget {
  const QuestionStep2({super.key});

  @override
  State<QuestionStep2> createState() => _QuestionStep2State();
}

class _QuestionStep2State extends State<QuestionStep2> {
  final List<String> options = [
    "Her gün",
    "Haftada birkaç kez",
    "Haftada bir",
    "Ayda birkaç kez",
    "Nadiren",
  ];

  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6A2EE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A2EE8),
        elevation: 0,
        centerTitle: true,
        title: const Text("2 / 5", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ne sıklıkla spor yaparsın?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  options.map((opt) {
                    final isSelected = opt == selected;
                    return ChoiceChip(
                      label: Text(opt),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() {
                          selected = opt;
                        });
                      },
                      selectedColor: Colors.white,
                      backgroundColor: const Color(0xFF6A2EE8),
                      labelStyle: TextStyle(
                        color:
                            isSelected ? const Color(0xFF6A2EE8) : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.white),
                      ),
                    );
                  }).toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed:
                    selected != null
                        ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QuestionStep3(),
                            ),
                          );
                        }
                        : null,
                child: const Text(
                  "İleri",
                  style: TextStyle(color: Color(0xFF6A2EE8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
