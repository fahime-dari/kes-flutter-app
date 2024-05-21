import 'package:ap4/add_inter.dart';
import 'package:flutter/material.dart';
import 'package:ap4/auth/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('android/images/logo.jpg', height: 120),
            const Text(
              "Bienvenue",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Fiche d'intervention"),
              onPressed: () async {
                goToLogin(context);
              },
            )
          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InterventionChoix()),
      );
}

// Future<void> addIntervention(
//     String commentaire,
//     String heureArrivee,
//     String heureDepart,
//     String idIntervention,
//     String marqueMachine,
//     String modeleMachine,
//     String nomClient,
//     String nomTechnicien,
//     String numIntervention,
//     String numSerieMachine,
//     String typeMachine) async {
//   CollectionReference intervention =
//       FirebaseFirestore.instance.collection('intervention');

//   // Ajout d'un nouveau document
// await intervention.add({
// //     'commentaire': commentaire,
// //     'heureArrivee': heureArrivee,
// //     'heureDepart': heureDepart,
// //     'idIntervention': idIntervention,
// //     'marqueMachine': marqueMachine,
// //     'modeleMachine': modeleMachine,
// //     'nomClient': nomClient,
// //     'nomTechnicien': nomTechnicien,
// //     'numIntervention': numIntervention,
// //     'numSerieMachine': numSerieMachine,
// //     'typeMachine': typeMachine,
// //   });
// // }
