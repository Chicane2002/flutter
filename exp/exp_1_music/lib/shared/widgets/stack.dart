import 'package:flutter/material.dart';

class SongStack extends StatefulWidget {
  String? imagePath;
  String? artistName;
  SongStack(
      {this.artistName = "Most Played",
      this.imagePath =
          "https://bro4u.com/blog/wp-content/uploads/2015/07/R7-600x652.jpg",
      super.key});

  @override
  State<SongStack> createState() => _SongStackState();
}

class _SongStackState extends State<SongStack> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.network(
                widget.imagePath!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: EdgeInsets.symmetric(
                horizontal: 4,
              ),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(33, 150, 243, 0.8),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.artistName!.split(" ")[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.artistName!.split(" ").length >= 2
                        ? widget.artistName!.split(" ")[1]
                        : "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       widget.artistName!,
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
