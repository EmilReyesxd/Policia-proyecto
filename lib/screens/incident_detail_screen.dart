import 'package:flutter/material.dart';
import '../models/incident.dart';

class IncidentDetailScreen extends StatelessWidget {
  final Incident incident;

  const IncidentDetailScreen({super.key, required this.incident});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(incident.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${incident.date}'),
            const SizedBox(height: 10),
            const Text('Descripción:'),
            Text(incident.description),
            const SizedBox(height: 10),
            incident.photoPath.isNotEmpty
                ? Image.asset(incident.photoPath)
                : const Text('No hay fotos disponibles'),
            const SizedBox(height: 10),
            incident.audioPath.isNotEmpty
                ? const Text('Audio grabado')
                : const Text('No hay audios disponibles'),
          ],
        ),
      ),
    );
  }
}
