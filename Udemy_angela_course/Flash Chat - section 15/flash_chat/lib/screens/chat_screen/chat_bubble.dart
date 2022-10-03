import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  String sender;
  String message;
  ChatBubble({required this.sender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 12, right: 12),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            sender,
            style: TextStyle(color: Colors.black),
          ),
          Container(
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),

                    blurRadius: 7,
                    offset: Offset(2, 4), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
                color: Colors.blueAccent,
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
