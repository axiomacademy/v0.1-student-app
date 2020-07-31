import 'package:flutter/material.dart';

import 'text_fields.dart';

class AxiomAppBar extends StatelessWidget {
  AxiomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: FilledTextFormField(
              labelText: "Search",
              prefixIcon: Icon(Icons.search, size: 25.0),
              validator: (input) {})),
      IconButton(
          padding: EdgeInsets.only(left: 10.0, right: 0.0),
          onPressed: () {},
          icon: Icon(Icons.menu, color: Color(0xFF5B5B5B), size: 25.0)),
    ]);
  }
}
