import 'package:flutter/material.dart';

class ShotCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: Text("Draggable child"),
      feedback: Text("feedback"),
      onDragStarted: () => print("Drag started"),
      onDragEnd: (drag) => print("Drag ended"),
      onDragCompleted: () => print("DRAG COMPLETED"),
    );
  }
}
