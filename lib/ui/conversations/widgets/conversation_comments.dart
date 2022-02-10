import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/conversation_store.dart';
import 'package:shedistrict/stores/notification_store.dart';
import 'package:shedistrict/ui/core/dateformatter.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class ConversationCommentsScreen extends StatefulWidget{
  final String postId;

  ConversationCommentsScreen(this.postId);
  @override
  _ConversationCommentsState createState() => _ConversationCommentsState();
}

class _ConversationCommentsState extends State<ConversationCommentsScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _text = TextEditingController();
  ConversationStore conversationStore = ConversationStore();
  NotificationStore notificationStore = NotificationStore();
  Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<void> postComment(currentPost) async{
      final user = await storage.get('user');
      final uid = await storage.get('uid');
      List existingComments = currentPost.containsKey('comments') ? currentPost['comments'] : [];

      final currentComment = {
        'comment' : _text.text,
        'user' : user,
        'uid' : uid,
        'createdAt' : DateTime.now()
      };

      var payload = [];
      if(existingComments.length == 0) {
        payload = [currentComment];
      }
      else{
        payload = [...existingComments, currentComment];
      }

      await conversationStore.addComment(widget.postId, payload);
      _text.text = "";


      final notificationPayload = {
        'user' : user,
        'owner_id' : currentPost['uid'],
        'type' : 'comment',
        'post' : {'id': widget.postId, ...currentPost},
        'isSeen' : false,
        'createdAt' : DateTime.now()
      };
      await notificationStore.addNotification(notificationPayload);
    }

    return Scaffold(
        body: StreamBuilder(
            stream: _firestore.collection("conversations")
                .doc(widget.postId).snapshots(),

            builder:  (BuildContext context, AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                Map doc = streamSnapshot.data!.data() as Map;
                List comments  = doc['comments'] != null ? doc['comments'] : [];

                return Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          SizedBox(
                              height: 65,
                              child: Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      iconSize: 30,
                                      icon: Icon(
                                        FeatherIcons.chevronLeft,
                                        color: Apptheme.conversattionColor,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Text('Comments', style: TextStyle(fontWeight: FontWeight.w500, color: Apptheme.conversattionColor, fontSize: 20),)
                                  ],
                                ),
                              )
                          ),
                          Divider(
                            height: 0,
                            color: Colors.black54,
                          ),
                          SizedBox(height: 20,),
                          Flexible(
                            fit: FlexFit.tight,
                            child: SingleChildScrollView(
                                reverse: true,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: comments.map((comment) {
                                      return Container(
                                        margin: EdgeInsets.only(top: 8, bottom: 8),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                                backgroundImage: NetworkImage(comment['user']['favouritePictures'][0]
                                                  // "assets/images/samplepic.png",
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                  child: Wrap(
                                                    direction: Axis.vertical,
                                                    spacing: 3,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            comment['user']['name'],
                                                            style: Apptheme(context)
                                                                .boldText.copyWith(
                                                              fontSize: Apptheme
                                                                  .normalTextSize,
                                                            ),
                                                          ),
                                                          SizedBox(width: 15),
                                                          Text(
                                                            DateFormatter().getVerboseDateTimeRepresentation(comment['createdAt']),
                                                            style: Apptheme(context)
                                                                .normalText.copyWith(
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            child:  Text(comment['comment']),
                                                          ),
                                                          // comment,
                                                        ],
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          )
                                      );
                                    }).toList()
                                )),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.black54,
                          ),
                          Container(
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                maxLines: 20,
                                textInputAction: TextInputAction.done,
                                controller: _text,
                                decoration: InputDecoration(
                                  suffixIcon: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.send,
                                          color: Apptheme.conversattionColor,),
                                        onPressed: () async{
                                          await postComment(doc);
                                        },
                                      ),
                                    ],
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Enter your comment",
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                );
              }
              else{
                return Text('Be the first to comment on this post');
              }
            }
        )
    );
  }
}