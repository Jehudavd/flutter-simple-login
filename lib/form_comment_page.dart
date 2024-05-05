import 'package:flutter/material.dart';
import 'package:flutter_app_course/controllers/comment_provider.dart';
import 'package:provider/provider.dart';

class FormCommentPage extends StatefulWidget {
  const FormCommentPage({super.key});

  @override
  State<FormCommentPage> createState() => _FormCommentPageState();
}

class _FormCommentPageState extends State<FormCommentPage> {
  @override
  Widget build(BuildContext context) {
    var commentProvider = context.watch<CommentProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Insert Comment'),),
      body: Form(
            key: commentProvider.formKey,
            child: ListView(
              children: [
                const Text(
                  'Subject',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                    controller: commentProvider.subjectController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tolong isi field ini';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Comment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                    controller: commentProvider.commentController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tolong isi field ini';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, elevation: 5),
                  onPressed: () {
                    context.read<CommentProvider>().insertComment(context);
                  },
                  child: const Text("Submit",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                // bodyMessage()
              ],
            ),
          ),
    );
  }
}