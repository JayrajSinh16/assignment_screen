import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/program_model.dart';

class ProgramRepository {
  final CollectionReference _ref = FirebaseFirestore.instance.collection('programs');

  Future<List<Program>> fetchPrograms() async {
    final snapshot = await _ref.get();
    return snapshot.docs
        .map((doc) => Program.fromFirestore(doc.data() as Map<String, dynamic>))
        .toList();
  }
}