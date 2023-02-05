import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../model/user_model.dart';
import 'local_sotre/local_store.dart';

class UserController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
   UserModel? user;
  bool isLoading = false;
  int selectgenderIndex=0;
  List gender=["Male","Female"];
  setGender(String category) {
    selectgenderIndex = gender.indexOf(category);
  }

  getUser() async {
    isLoading = true;
    notifyListeners();
    String? docId = await LocalStore.getDocId();
    var res =
        await firestore.collection("users").doc(docId).get();
    user = UserModel.fromJson(res.data());
    isLoading = false;
    notifyListeners();
  }

  logOut(VoidCallback onSuccess) async {
    await LocalStore.storeClear();
    onSuccess();
  }
}
