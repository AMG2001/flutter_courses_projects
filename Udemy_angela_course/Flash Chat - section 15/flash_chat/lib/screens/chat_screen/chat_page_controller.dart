import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatPageController extends GetxController {
  TextEditingController messageTextEditingController = TextEditingController();

  String message = "";
  final firebaseFireStoreInstance = FirebaseFirestore.instance;

  void uploadMessage() async {
    try {
      /**
       * Get instance of Firebase FireStore .
       * choose collection("name of collection that you have created remotely").add("map of you data").
       */
      await firebaseFireStoreInstance.collection("messages").add({
        "text": message,
        "sender": FirebaseAuth.instance.currentUser!.email,
        "createdAt":DateTime.now()
      }).then((value) => print("message sent"));
    } catch (e) {
      print("Uploading message Failed !!");
      print(e);
    }
  }

  void getMessages() async {
    /**
     * First we need to checkout our collection that we will get data from
     */
    final messagesDocuments = await firebaseFireStoreInstance
        .collection("messages")
        .snapshots(); // get method return QuerySnapShot .
    /**
         * from this query snapshot we need to get documents so
         * we will use get().docs .
         * now we get docs , we need to access it;s data so :
         * get().docs.data() // will return all maps that consider data
         */
    messagesDocuments.forEach((element) {
      for (var document in element.docs) {
        print(document.data());
      }
    });
  }
}
