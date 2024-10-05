// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';

class PrescriptionForm extends StatefulWidget {
  const PrescriptionForm({super.key});

  @override
  _PrescriptionFormState createState() => _PrescriptionFormState();
}

class _PrescriptionFormState extends State<PrescriptionForm> {
  List<Map<String, String>> medications = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: medications.length,
                itemBuilder: (context, index) {
                  return MedicationInputField(
                    onChanged: (medication, dosage) {
                      setState(() {
                        medications[index] = {'medication': medication, 'dosage': dosage};
                      });
                    },
                    initialValue: medications[index],
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    medications.add({'medication': '', 'dosage': ''});
                  });
                },
                child: const Text('Ajouter Médicament'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    // Logique pour soumettre la prescription
                    print(medications);
                  }
                },
                child: const Text('Soumettre Prescription'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicationInputField extends StatefulWidget {
  final Function(String, String) onChanged;
  final Map<String, String>? initialValue;

  const MedicationInputField({super.key, required this.onChanged, this.initialValue});

  @override
  _MedicationInputFieldState createState() => _MedicationInputFieldState();
}

class _MedicationInputFieldState extends State<MedicationInputField> {
  TextEditingController medicationController = TextEditingController();
  TextEditingController dosageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      medicationController.text = widget.initialValue!['medication'] ?? '';
      dosageController.text = widget.initialValue!['dosage'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: medicationController,
          decoration: const InputDecoration(labelText: 'Médicament'),
          onChanged: (value) {
            widget.onChanged(medicationController.text, dosageController.text);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Entrez le nom du médicament';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: dosageController,
          decoration: const InputDecoration(labelText: 'Posologie'),
          maxLines: null, // Permet un champ de texte multiligne
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            widget.onChanged(medicationController.text, dosageController.text);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Entrez la posologie';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}


