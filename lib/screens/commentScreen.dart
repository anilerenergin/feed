import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:greatr_feed/firebase_functions/comment_function.dart';
import 'package:greatr_feed/models/comment_model.dart';

import '../models/post_model.dart';

class CommentScreen extends StatefulWidget {
  String postId;
  PostModel currentPost;
  List<CommentModel> commentList;

  CommentScreen(
      {required this.postId,
      required this.currentPost,
      required this.commentList});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TextEditingController commentField = TextEditingController();
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.indigoAccent, //change your color here
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "greaTR Comment",
            style: TextStyle(color: Colors.indigoAccent),
          )),
      body: Stack(
        children: [
          Container(
            height: height - height * 0.08,
            child: ListView(
              controller: _scrollController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      widget.currentPost.profileImg!),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.currentPost.composer!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.currentPost.location!,
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ), //name photo
                        widget.currentPost.postImg ==""
                            ? SizedBox.shrink()
                            : Container(
                                width: width,
                                height: height * 0.3,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            widget.currentPost.postImg!))),
                              ), //photo
                        Container(
                          child: Text(widget.currentPost.postText!),
                        ), //post text
                        SizedBox(
                          height: 5,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      FontAwesomeIcons.heart,
                                      color: Colors.indigoAccent,
                                    ),
                                  ),
                                ),
                                Text(
                                  widget.currentPost.likeCount.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ), //like comment
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.commentList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                                widget.commentList[index].composer!.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigoAccent)),
                            subtitle: Text(
                              widget.commentList[index].comment!.toString(),
                              style: TextStyle(color: Colors.black),
                            ));
                      }),
                ),
                SizedBox(
                  height: height * 0.1,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.indigoAccent,
                ),
                width: width,
                height: height * 0.08,
                child: Row(
                  children: [
                    Container(
                      width: width * 0.86,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 3),
                        child: TextFormField(
                          onTap: () {
                            setState(() {
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn,
                              );
                            });
                          },
                          controller: commentField,
                          decoration: const InputDecoration(
                            hintText: "Yorum yaz??n??z",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                    ),
                    IconButton(
                        onPressed: () async {
                          await addPostComment(widget.postId, commentField.text,
                                  "An??l Eren", DateTime.now())
                              .then((value) => widget.commentList = [])
                              .then((value) => getPostComments(
                                      widget.commentList, widget.postId)
                                  .then((value) => widget.commentList = value));
                          setState(() {
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            );
                          });
                          FocusScope.of(context).unfocus();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.solidPaperPlane,
                          color: Colors.white,
                        ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
