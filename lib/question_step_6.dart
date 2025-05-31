import 'package:flutter/material.dart';
import 'question_step_7.dart';

class QuestionStep6 extends StatefulWidget {
  const QuestionStep6({super.key});

  @override
  State<QuestionStep6> createState() => _QuestionStep6State();
}

class _QuestionStep6State extends State<QuestionStep6> {
  final List<String> options = [
    'Forma girmek',
    'Yeni insanlarla tanışmak',
    'Eğlenmek',
    'Kendini geliştirmek',
    'Profesyonelleşmek',
  ];
  final List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6A2EE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A2EE8),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 75),
            SizedBox(height: 25),
            const Text(
              "Son olarak, sporsepetinden beklentin ne?",
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
                  options.map((opt) {
                    final isSelected = selectedOptions.contains(opt);
                    return FilterChip(
                      label: Text(opt),
                      selected: isSelected,
                      onSelected: (value) {
                        setState(() {
                          if (value) {
                            selectedOptions.add(opt);
                          } else {
                            selectedOptions.remove(opt);
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
                    selectedOptions.isNotEmpty
                        ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QuestionStep7(),
                            ),
                          );
                        }
                        : null,
                child: const Text(
                  "Tamamla",
                  style: TextStyle(color: Color(0xFF6A2EE8)),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white),
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
