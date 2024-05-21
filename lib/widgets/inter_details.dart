import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InterventionDetailPage extends StatefulWidget {
  final String interventionId;

  const InterventionDetailPage({Key? key, required this.interventionId})
      : super(key: key);

  @override
  _InterventionDetailPageState createState() => _InterventionDetailPageState();
}

class _InterventionDetailPageState extends State<InterventionDetailPage> {
  TextEditingController commentaireController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chargerDetailsIntervention();
  }

  void chargerDetailsIntervention() async {
    var doc = await FirebaseFirestore.instance
        .collection('intervention')
        .doc(widget.interventionId)
        .get();

    if (doc.exists) {
      setState(() {
        commentaireController.text = doc.data()?['commentaire'] ?? '';
      });
    }
  }

  void mettreAJourCommentaire() async {
    await FirebaseFirestore.instance
        .collection('intervention')
        .doc(widget.interventionId)
        .update({'commentaire': commentaireController.text});
    Navigator.pop(context); // Optionally pop back after updating
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails de l'intervention"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: commentaireController,
              decoration: const InputDecoration(
                labelText: 'Commentaire',
                border: OutlineInputBorder(),
              ),
              minLines: 3,
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: mettreAJourCommentaire,
              child: const Text("Mettre à jour"),
            ),
          ],
        ),
      ),
    );
  }
}
