import 'package:flutter/material.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

class DetailsView extends StatelessWidget {
  final String name;

  const DetailsView({Key? key, this.name = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}
