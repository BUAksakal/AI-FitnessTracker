import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseTile extends StatefulWidget {
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;
  void Function(bool?)? onCheckBoxChanged;

  ExerciseTile({
    super.key,
    required this.exerciseName,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.isCompleted,
    required this.onCheckBoxChanged, // <-- HATA DÜZELTİLEN SATIR
  });

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        title: Text(
          widget.exerciseName,
        ),
        subtitle: Row(
          children: [
            // weight
            Chip(
              label: Text(
                "${widget.weight}kg",
              ),
            ),
            // reps
            Chip(
              label: Text(
                "${widget.reps}reps",
              ),
            ),
            // sets
            Chip(
              label: Text(
                "${widget.sets}sets",
              ),
            ),
          ],
        ),
        trailing: Checkbox(
          value: widget.isCompleted,
          onChanged: (value) => widget.onCheckBoxChanged?.call(value),
        ),
      ),
    );
  }
}