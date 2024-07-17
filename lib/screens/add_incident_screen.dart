import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import '../models/incident.dart';

class AddIncidentScreen extends StatefulWidget {
  final Function(Incident) addIncident;

  const AddIncidentScreen({super.key, required this.addIncident});

  @override
  _AddIncidentScreenState createState() => _AddIncidentScreenState();
}

class _AddIncidentScreenState extends State<AddIncidentScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _photoPath;
  String? _audioPath;
  DateTime _selectedDate = DateTime.now();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final photoPath = '${directory.path}/${DateTime.now().toIso8601String()}.png';
      await pickedFile.saveTo(photoPath);
      setState(() {
        _photoPath = photoPath;
      });
    }
  }

  void _saveIncident() {
    final title = _titleController.text;
    final description = _descriptionController.text;

    if (title.isEmpty || description.isEmpty) {
      return;
    }

    final newIncident = Incident(
      title: title,
      date: _selectedDate,
      description: description,
      photoPath: _photoPath ?? '',
      audioPath: _audioPath ?? '',
    );

    widget.addIncident(newIncident);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añade incidente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripcion'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}'),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text(_photoPath == null ? 'No se añadió ninguna foto' : 'Foto añadida'),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: _pickImage,
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveIncident,
              child: const Text('Guarda incidente'),
            ),
          ],
        ),
      ),
    );
  }
}
