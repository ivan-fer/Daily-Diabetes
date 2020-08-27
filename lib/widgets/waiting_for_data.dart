import 'package:flutter/material.dart';

class WaitingForData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: const CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Cargando ...'),
            )
          ],
        ),
      ),
    );
  }
}
