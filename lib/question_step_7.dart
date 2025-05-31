import 'home_screen.dart';
import 'package:flutter/material.dart';

class QuestionStep7 extends StatefulWidget {
  const QuestionStep7({super.key});

  @override
  State<QuestionStep7> createState() => _QuestionStep7State();
}

class _QuestionStep7State extends State<QuestionStep7> {
  final List<String> options = [
    'Sosyal medya (Instagram, Twitter vb.)',
    'Arkadaş tavsiyesi',
    'Etkinlik / turnuva',
    'Google / arama motoru',
    'Reklam (online ya da fiziksel)',
    'Diğer',
  ];

  final List<String> selected = [];
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
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 75),
            const SizedBox(height: 25),
            const Text(
              "Bizi nereden duydunuz?",
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
                          showOtherField = selected.contains('Diğer');
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
                    hintText: "Lütfen belirtin",
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
                  final hasOther = selected.contains('Diğer');
                  final isOtherValid =
                      !hasOther ||
                      (otherInput != null && otherInput!.trim().isNotEmpty);

                  if (selected.isNotEmpty && isOtherValid) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                    );
                  }
                },
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
                  Icon(Icons.circle, size: 10, color: Colors.white54),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
