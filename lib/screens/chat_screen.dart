
import 'package:flutter/material.dart';
import 'package:covid_19/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance; //ye
User loggedInUser;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
   
  final messageTextController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  String messageText;
  
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  
  void getCurrentUser() {
    try{
      final User user = _auth.currentUser;           
    if(user != null){
      loggedInUser = user;
      print(loggedInUser.email);
    }
    }
    catch(e){
      print(e);
    } 
  }



 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
               _auth.signOut();
              Navigator.pop(context); 
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
               MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                       messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
           return StreamBuilder<QuerySnapshot>(
                 stream: firestore.collection('messages').snapshots(),  // here snapshot is flutters Asyc Snapshot
                 builder: (context,snapshot){  
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                      );
                    }
                      final messages = snapshot.data.docs.reversed;
                      List<MessageBubble> messageBubbles = [];
                      for(var message in messages){
                        final messageText = message.data()['text'];
                        final messageSender = message.data()['sender'];

                        final currentUser = loggedInUser.email;

                        final messageBubble = MessageBubble(
                          sender: messageSender,
                          text: messageText,
                          isMe: currentUser == messageSender,
                          );
                        messageBubbles.add(messageBubble); 
                      }
                      return Expanded(
                          child: ListView(
                            reverse: true,   //messege ordering is se sahi hoi he
                            padding: EdgeInsets.symmetric(horizontal:10.0,vertical: 20.0),
                          children: messageBubbles,
                        ),
                      );
                    }
               );
  }
}

class MessageBubble extends StatelessWidget {
  
  MessageBubble({this.sender,this.text,this.isMe});
  final String sender;
  final String text; 
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender,style: TextStyle(color: Colors.black54,fontSize:12.0),),
          Material(
            borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),) : BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),),
            elevation: 5.0,
               color:isMe ? Colors.lightBlueAccent : Colors.grey[300],
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  child: Text(
              '$text',
              style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.black54,
              ),
              ),
                ),
          ),
        ],
      ),
    );
  }
}