import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  String sender;
  String message;
  bool isMe;
  ChatBubble({required this.sender, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 12, right: 12),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(
              sender,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),

                    blurRadius: 7,
                    offset: Offset(2, 4), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: isMe ? Radius.circular(16) : Radius.circular(0),
                    topRight: isMe ? Radius.circular(0) : Radius.circular(16)),
                color: isMe ? Colors.blueAccent : Colors.white,
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                message,
                style: TextStyle(color: isMe ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
