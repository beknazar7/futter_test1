import 'package:flutter/material.dart';
 
class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});
 
  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}
 
class _FeedbackFormState extends State<FeedbackForm> {
  String name = '';
  bool isSent = false;
  final TextEditingController _controller = TextEditingController();
 
  void _submit() {
    if (name.trim().isEmpty) return;
 
    setState(() {
      isSent = true;
    });

    _controller.clear();
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Ваше имя',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            name = value;
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Отправить'),
        ),
        const SizedBox(height: 16),
 
        if (isSent)
          Text(
            'Отправлено! Спасибо, $name',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
          ),
      ],
    );
  }
}