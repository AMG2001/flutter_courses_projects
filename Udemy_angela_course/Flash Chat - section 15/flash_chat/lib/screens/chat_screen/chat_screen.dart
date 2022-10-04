import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/config/user_state.dart';
import 'package:flash_chat/screens/chat_screen/chat_bubble.dart';
import 'package:flash_chat/screens/chat_screen/chat_page_controller.dart';

import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatPageController = Get.put(ChatPageController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                await UserState.userLoggedOut();
                await FirebaseAuth.instance
                    .signOut()
                    .then((value) => Get.back());
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: GetBuilder<ChatPageController>(builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                  stream: chatPageController.firebaseFireStoreInstance
                      .collection("messages")
                      .orderBy("createdAt")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    /**
                     * List of messages that fetched form firestore
                     */
                    late bool currentUser;
                    List<ChatBubble> messagesList = [];
                    /**
                     * snapshot : 
                     */
                    var querySnapshot = snapshot.data!.docs.reversed;
                    /**
                   * get every document alone from the whole snapshot: 
                   */
                    querySnapshot.forEach((document) {
                      messagesList.add(ChatBubble(
                        sender: document.get('sender'),
                        message: document.get('text'),
                        isMe: FirebaseAuth.instance.currentUser!.email ==
                            document.get('sender'),
                      ));
                    });

                    return Expanded(
                      child: ListView(
                        reverse: true,
                        children: messagesList,
                      ),
                    );
                  }),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller:
                            chatPageController.messageTextEditingController,
                        onChanged: (value) {
                          chatPageController.message = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        chatPageController.uploadMessage();
                        chatPageController.messageTextEditingController.clear();
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
