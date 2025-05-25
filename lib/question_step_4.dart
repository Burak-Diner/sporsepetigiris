import 'package:flutter/material.dart';
import 'question_step_5.dart';

class QuestionStep4 extends StatefulWidget {
  const QuestionStep4({super.key});

  @override
  State<QuestionStep4> createState() => _QuestionStep4State();
}

class _QuestionStep4State extends State<QuestionStep4> {
  final List<String> options = ['Online', 'Fiziksel'];
  final List<String> selected = [];

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
              "Sence online etkinlikler mi?, yoksa fiziksel etkinlikler mi?",
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
              children:
                  options.map((opt) {
                    final isSelected = selected.contains(opt);
                    return FilterChip(
                      label: Text(opt),
                      selected: isSelected,
                      onSelected: (value) {
                        setState(() {
                          if (value) {
                            selected.add(opt);
                          } else {
                            selected.remove(opt);
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
                              builder: (_) => const QuestionStep5(),
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
