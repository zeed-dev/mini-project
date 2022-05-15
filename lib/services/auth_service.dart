import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('users');

  Future<UserModel> getUserById(String userId) async {
    DocumentSnapshot snapshot = await _ref.doc(userId).get();
    return UserModel(
      id: userId,
      email: snapshot["email"],
      name: snapshot["name"],
      address: snapshot["address"],
      phone: snapshot["phone"],
      isAdmin: snapshot["isAdmin"],
    );
  }

  Future<void> setUser(UserModel user) async {
    await _ref.doc(user.id).set({
      "id": user.id,
      "email": user.email,
      "name": user.name,
      "address": user.address,
      "phone": user.phone,
      "isAdmin": user.isAdmin,
    });
  }

  Future<UserModel> signIn(String email, String password) async {
    UserCredential user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    UserModel userModel = await getUserById(user.user?.uid ?? "");
    return userModel;
  }

  Future<UserModel> signUp(UserModel users, String password) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
      email: users.email ?? "",
      password: password,
    );

    UserModel userModel = UserModel(
      id: user.user?.uid,
      email: users.email,
      name: users.name,
      address: users.address,
      phone: users.phone,
      isAdmin: users.isAdmin,
    );

    await setUser(userModel);
    return userModel;
  }

  Future<UserModel?> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    UserModel userModel = await getUserById(user?.uid ?? "");
    return userModel;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

AuthService authService = AuthService();
