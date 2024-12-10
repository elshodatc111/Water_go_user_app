import 'package:flutter/material.dart';

class CodePage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<CodePage> {
  final List<TextEditingController> _controllers =List.generate(6, (index) => TextEditingController());
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.addListener(_checkIfOTPComplete);
    }
  }
  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
  void _checkIfOTPComplete() {
    setState(() {
      _isButtonEnabled = _controllers.every((controller) =>controller.text.isNotEmpty && controller.text.length == 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo1.png',
                height: 120,
              ),
              const SizedBox(height: 64),
              const Text(
                "+99 891 *** 15 telefon raqaming 6 xonali tasdiqlash kodi yuborildi tasdiqlash kodini kiriting",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _controllers[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context)
                              .nextFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isButtonEnabled ? () {
                  final otpCode = _controllers.map((c) => c.text).join();
                  print("Tasdiqlash kodi: $otpCode");
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Tasdiqlash",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color:Colors.white),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
