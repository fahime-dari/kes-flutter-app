class Intervention {
  // Attributs
  final String id;
  final String commentaire;
  final String dateIntervention;
  final String marqueMachine;
  final String modeleMachine;
  final String nomClient;
  final String nomTechnicien;
  final String numIntervention;
  final String numSerieMachine;
  final String typeMachine;

  // Constructeur principal
  Intervention({
    required this.id,
    required this.commentaire,
    required this.dateIntervention,
    required this.marqueMachine,
    required this.modeleMachine,
    required this.nomClient,
    required this.nomTechnicien,
    required this.numIntervention,
    required this.numSerieMachine,
    required this.typeMachine,
  });

  // Usine pour créer une instance à partir d'un document Firestore
  factory Intervention.fromFirestore(Map<String, dynamic> doc, String id) {
    return Intervention(
      id: id,
      commentaire: doc['commentaire'] as String,
      dateIntervention: doc['dateIntervention'] as String,
      marqueMachine: doc['marqueMachine'] as String,
      modeleMachine: doc['modeleMachine'] as String,
      nomClient: doc['nomClient'] as String,
      nomTechnicien: doc['nomTechnicien'] as String,
      numIntervention: doc['numIntervention'] as String,
      numSerieMachine: doc['numSerieMachine'] as String,
      typeMachine: doc['typeMachine'] as String,
    );
  }
}
