import 'package:flutter/material.dart';
import '../models/incident.dart';

class IncidentCard extends StatelessWidget {
  final Incident incident;
  final VoidCallback onTap;

  const IncidentCard({super.key, required this.incident, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(incident.title),
        subtitle: Text(incident.date.toString()),
        onTap: onTap,
      ),
    );
  }
}
