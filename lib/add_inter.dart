import 'package:flutter/material.dart';
import 'package:ap4/models/intervention.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ap4/widgets/inter_details.dart';

class InterventionChoix extends StatelessWidget {
  const InterventionChoix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sélectionnez une intervention')),
        body: const InterventionPicker(),
      ),
    );
  }
}

// Widget pour choisir la fiche d'intervention
class InterventionPicker extends StatefulWidget {
  const InterventionPicker({Key? key}) : super(key: key);

  @override
  _InterventionPickerState createState() => _InterventionPickerState();
}

class _InterventionPickerState extends State<InterventionPicker> {
  String? selectedNumIntervention;
  // Mettre les documents dans une liste
  List<Intervention> interventions = [];

  @override
  void initState() {
    super.initState();
    chargerInterventions();
  }

  void chargerInterventions() async {
    var collection = FirebaseFirestore.instance.collection('intervention');
    var snapshot = await collection.get();
    List<Intervention> loadedInterventions = [];
    for (var doc in snapshot.docs) {
      loadedInterventions.add(Intervention.fromFirestore(doc.data(),
          doc.id)); // Utilisation des données et de l'ID du document
    }
    setState(() {
      interventions = loadedInterventions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("Sélectionnez une intervention :"),
        DropdownButton<String>(
          value: selectedNumIntervention,
          isExpanded: true,
          hint: const Text("Choisir une intervention"),
          onChanged: (String? newValue) {
            setState(() {
              selectedNumIntervention = newValue;
            });
          },
          items: interventions.map((Intervention intervention) {
            String displayText =
                "${intervention.numIntervention} - ${intervention.dateIntervention} - ${intervention.nomClient}";
            return DropdownMenuItem<String>(
              value: intervention.id, // Utiliser l'ID pour la navigation
              child: Text(displayText),
            );
          }).toList(),
        ),
        ElevatedButton(
          onPressed: selectedNumIntervention == null
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InterventionDetailPage(
                        interventionId: selectedNumIntervention!,
                      ),
                    ),
                  );
                },
          child: const Text("Sélectionner"),
        )
      ],
    );
  }
}
