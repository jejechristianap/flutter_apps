import 'package:flutter/material.dart';

import 'bio.dart';

class CardTemplate extends StatelessWidget {
  const CardTemplate({this.bio, this.delete});
  final Bio bio;
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
      ),
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                bio.skill,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.amber[400],
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 1,
              child: Text(
                bio.level,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.amber[200],
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: IconButton(
            //     onPressed: () => delete(),
            //     icon: const Icon(
            //       Icons.delete,
            //       color: Colors.grey,
            //     ),
            //   )
            // )
          ],
        ),
      ),
    );
  }
}