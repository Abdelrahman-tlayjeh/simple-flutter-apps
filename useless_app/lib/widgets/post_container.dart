import 'package:flutter/material.dart';
import '../models/post.dart';

class PostContainr extends StatelessWidget {
  final Post post;
  const PostContainr({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(right: 7, left: 3, top: 15, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //first letter Avatar
          CircleAvatar(
            backgroundColor: post.color,
            radius: 20,
            child: Text(
              post.title[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          //vertical spacing
          const SizedBox(
            width: 10,
          ),

          //post info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Text(
                  post.title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //post body
                Text(
                  post.body ?? "",
                  maxLines: 3,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 75, 72, 72),
                    fontSize: 17,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
