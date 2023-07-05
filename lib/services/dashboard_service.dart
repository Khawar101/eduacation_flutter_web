import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/app/app.locator.dart';
import 'package:education_flutter_web/services/Model/reportModel.dart';
import 'package:education_flutter_web/services/login_service.dart';

class DashboardService {
  final _loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<ReportModel>> reportStream() {
    final stream = firestore.collection("subscription").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return ReportModel.fromJson(doc.data());
        }).toList());
  }
}
