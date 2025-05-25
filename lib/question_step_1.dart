import 'package:flutter/material.dart';
import 'question_step_2.dart';

class QuestionStep1 extends StatefulWidget {
  const QuestionStep1({super.key});

  @override
  State<QuestionStep1> createState() => _QuestionStep1State();
}

class _QuestionStep1State extends State<QuestionStep1> {
  final List<String> sports = [
    'Futbol',
    'Basketbol',
    'Voleybol',
    'Go Kart',
    'Yüzme',
    'Tenis',
  ];
  final List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6A2EE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A2EE8),
        elevation: 0,
        leading: const SizedBox(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 75),
            SizedBox(height: 25),
            Text(
              "Öncelikle seni biraz tanıyarak başlayalım...",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 25),
            Text(
              "Favori sporun hangisi?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  sports.map((sport) {
                    final isSelected = selected.contains(sport);

                    return FilterChip(
                      label: Text(sport),
                      selected: isSelected,
                      onSelected: (value) {
                        setState(() {
                          if (value) {
                            selected.add(sport);
                          } else {
                            selected.remove(sport);
                          }
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
                      showCheckmark: false,
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
                    selected.isNotEmpty
                        ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QuestionStep2(),
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

            const SizedBox(height: 12),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.circle, size: 10, color: Colors.white),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
