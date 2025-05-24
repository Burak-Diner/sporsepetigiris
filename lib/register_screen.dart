import 'package:flutter/material.dart';
import 'question_step_1.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  DateTime? selectedDate;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6A2EE8),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/images/logo.png', width: 60)),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "Kaydol",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              // Bu sayede beyaz kutu ekranın altına kadar uzanır
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildTextField(label: "İsim")),
                          const SizedBox(width: 10),
                          Expanded(child: _buildTextField(label: "Soyisim")),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildDateField(),
                      const SizedBox(height: 12),
                      _buildGenderField(),
                      const SizedBox(height: 12),
                      _buildTextField(label: "+90", icon: Icons.phone),
                      const SizedBox(height: 12),
                      _buildTextField(label: "E-Mail", icon: Icons.email),
                      const SizedBox(height: 12),
                      _buildPasswordField("Şifre", _obscurePassword, () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      }),
                      const SizedBox(height: 12),
                      _buildPasswordField("Şifre Onayla", _obscureConfirm, () {
                        setState(() => _obscureConfirm = !_obscureConfirm);
                      }),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6A2EE8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const QuestionStep1(),
                              ),
                            );
                          },
                          child: const Text(
                            "Kaydol",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: "Zaten bir hesabın var mı? ",
                              children: [
                                TextSpan(
                                  text: "Giriş Yap",
                                  style: TextStyle(
                                    color: Color(0xFF6A2EE8),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, IconData? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        hintText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }

  Widget _buildPasswordField(
    String label,
    bool obscure,
    VoidCallback onToggle,
  ) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: onToggle,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime(2000),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() => selectedDate = picked);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.calendar_today),
            hintText:
                selectedDate != null
                    ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                    : "Doğum Tarihi",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
        ),
      ),
    );
  }

  Widget _buildGenderField() {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person_outline),
        hintText: "Cinsiyet",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      items:
          ["Erkek", "Kadın", "Belirtmek İstemiyorum"]
              .map(
                (gender) =>
                    DropdownMenuItem(value: gender, child: Text(gender)),
              )
              .toList(),
      onChanged: (value) {
        setState(() => selectedGender = value);
      },
    );
  }
}
