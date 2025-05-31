import 'package:flutter/material.dart';
import 'question_step_5.dart';

class QuestionStep4 extends StatefulWidget {
  const QuestionStep4({super.key});

  @override
  State<QuestionStep4> createState() => _QuestionStep4State();
}

class _QuestionStep4State extends State<QuestionStep4> {
  final List<String> options = [
    'Rekabet / Maç kazanmak',
    'Eğlenmek ve keyifli vakit geçirmek',
    'Antrenman yapmak ve gelişmek',
    'Yeni insanlarla tanışmak / sosyalleşmek',
    'Sağlıklı kalmak / kilo vermek',
    'Diğer',
  ];
  final List<String> selectedOptions = [];
  bool showOtherField = false;
  String? otherInput;

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
            const SizedBox(height: 25),
            const Text(
              "Spor Yapma Amacın Nedir?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Spor yaparken seni en çok motive eden şey nedir?\n(Birden fazla seçenek işaretlenebilir)",
              style: TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  options.map((option) {
                    final isSelected = selectedOptions.contains(option);
                    return FilterChip(
                      label: Text(option),
                      selected: isSelected,
                      onSelected: (value) {
                        setState(() {
                          if (value) {
                            selectedOptions.add(option);
                          } else {
                            selectedOptions.remove(option);
                          }
                          showOtherField = selectedOptions.contains('Diğer');
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
            if (showOtherField)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  onChanged: (value) => otherInput = value,
                  decoration: InputDecoration(
                    hintText: "Lütfen belirtin...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                ),
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
                onPressed: () {
                  final hasOther = selectedOptions.contains('Diğer');
                  final isOtherValid =
                      !hasOther ||
                      (otherInput != null && otherInput!.trim().isNotEmpty);

                  if (selectedOptions.isNotEmpty && isOtherValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuestionStep5()),
                    );
                  }
                },
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
