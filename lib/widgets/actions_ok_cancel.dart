import 'package:flutter/material.dart';
import '../constants.dart';

class OkCancelActions extends StatefulWidget {
  final String ok;
  final String cancel;
  final void Function() onOk;
  final void Function() onCancel;

  const OkCancelActions(
      {Key key, this.ok, this.cancel, this.onOk, this.onCancel})
      : super(key: key);

  @override
  _OkCancelActionsState createState() => _OkCancelActionsState();
}

class _OkCancelActionsState extends State<OkCancelActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: FlatButton(
            onPressed: () => widget.onCancel(),
            child: Text(
              widget.cancel ?? 'Cancelar',
              style: TextStyle(color: primaryDarkColor),
            ),
          ),
        ),
        RaisedButton(
          color: primaryDarkColor,
          onPressed: () => widget.onOk(),
          child: Text(
            widget.ok ?? 'Guardar',
            style: TextStyle(color: secondaryTextColor),
          ),
        ),
      ],
    );
  }
}
