import 'package:flutter/material.dart';

class NothingToSee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.music_note,
              size: 80,
              color: Colors.teal,
            ),
            Text('Nada que mostrar aún'),
          ],
        ),
      ),
    );
  }
}
