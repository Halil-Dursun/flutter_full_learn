import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({Key? key, this.postId}) : super(key: key);
  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentItem;

  @override
  void initState() {
    postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
    super.initState();
  }
    void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void fetchItemsWithId(int postId)async{
    _changeLoading();
    _commentItem = await postService.fetchRelatedCommentsWithPostId(postId);
    _changeLoading();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentItem?.length ?? 0,
        itemBuilder: (context,index){
        return Card(
          child: Text(_commentItem?[index].email ?? '@'),
        );
      }),
    );
  }
}