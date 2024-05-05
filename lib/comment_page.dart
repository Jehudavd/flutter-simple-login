import 'package:flutter/material.dart';
import 'package:flutter_app_course/controllers/comment_provider.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  void initState() {
    super.initState();
    context.read<CommentProvider>().getProduct();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Daftar Product'),
        ),
        body: Container(
          height: MediaQuery.sizeOf(context).height / 7,
          child: bodyData(context, context.watch<CommentProvider>().state),
        ));
  }

  Widget bodyData(BuildContext context, CommentState state) {
    switch (state) {
      case CommentState.success:
        var dataResult = context.watch<CommentProvider>().listComment;
        return ListView.builder(
          itemCount: dataResult!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(color: Colors.black)),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJHB2LmJDE8mRo5vCggGcP-G5Jkov0nOYt700GGxzzQg&s',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dataResult[index].subject ?? ''),
                    Text(dataResult[index].comment ?? ''),
                  ],
                ),
              ],
            ),
          ),
        );
      case CommentState.nodata:
        return Center(
          child: Text('No Data Comment'),
        );
      default:
        return CircularProgressIndicator();
    }
  }
}