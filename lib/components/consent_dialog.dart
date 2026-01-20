import 'package:flutter/material.dart';

class ConsentDialog extends StatelessWidget {
  const ConsentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Política de Privacidade'),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Este site coleta dados de uso para melhorar sua experiência. Os dados coletados incluem:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('• Páginas visitadas'),
            Text('• Tempo de permanência'),
            Text('• Tipo de dispositivo e navegador'),
            Text('• Interações com elementos da página'),
            SizedBox(height: 16),
            Text(
              'Todos os dados são armazenados localmente e não são compartilhados com terceiros. Você pode revogar seu consentimento a qualquer momento.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Recusar'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Aceitar'),
        ),
      ],
    );
  }
}
