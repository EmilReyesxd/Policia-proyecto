import 'package:flutter/material.dart';
import 'add_incident_screen.dart';
import 'incident_detail_screen.dart';
import 'about_screen.dart';
import '../models/incident.dart';
import '../widgets/incident_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Incident> _incidents = [];

  void _addIncident(Incident incident) {
    setState(() {
      _incidents.add(incident);
    });
  }

  void _deleteAllIncidents() {
    setState(() {
      _incidents.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de la Policia Secreta'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteAllIncidents,
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },
          ),
        ],
      ),
      body: _incidents.isEmpty
          ? const Center(child: Text('Ningun incidente grabado'))
          : ListView.builder(
              itemCount: _incidents.length,
              itemBuilder: (context, index) {
                return IncidentCard(
                  incident: _incidents[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IncidentDetailScreen(incident: _incidents[index]),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddIncidentScreen(addIncident: _addIncident)),
          );
        },
      ),
    );
  }
}
