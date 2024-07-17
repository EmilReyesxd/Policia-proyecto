import 'package:flutter/material.dart';
import '../models/officer.dart';

class AboutScreen extends StatelessWidget {
  final Officer officer = Officer(
    photo: 'assets/images/officer.jpg', // Asegúrate de tener esta imagen en la carpeta assets
    firstName: 'John',
    lastName: 'Doe',
    badgeNumber: '123456',
    quote: 'Sirviendo con honor e integridad.',
  );

  AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre el oficial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(officer.photo),
                radius: 50,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Nombre: ${officer.firstName} ${officer.lastName}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Numero de placa: ${officer.badgeNumber}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cita:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              officer.quote,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
