import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wtracker/data/workout_data.dart';

class WorkoutPage extends StatefulWidget {
  final String workoutName;
  const WorkoutPage({super.key, required this.workoutName});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final exerciseNameController = TextEditingController();
  final weightController = TextEditingController();
  final repsController = TextEditingController();
  final setsNameController = TextEditingController();

  // Emoji (okunabilir, işlevsiz, sadece görünüm)
  String getEmoji(String name) {
    final l = name.toLowerCase();
    if (l.contains("upper")) return "💪 ";
    if (l.contains("lower")) return "🦵 ";
    return "🔥 ";
  }

  // Checkbox
  void onCheckBoxChanged(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercise(workoutName, exerciseName);
  }

  // ✅ Dialog
  void createNewEcxercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "Add Exercise",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField(exerciseNameController, "Exercise Name"),
            const SizedBox(height: 6),
            _buildTextField(weightController, "Weight (kg)"),
            const SizedBox(height: 6),
            _buildTextField(repsController, "Reps"),
            const SizedBox(height: 6),
            _buildTextField(setsNameController, "Sets"),
          ],
        ),
        actions: [
          TextButton(onPressed: save, child: const Text("Save", style: TextStyle(color: Colors.black))),
          TextButton(onPressed: cancel, child: const Text("Cancel", style: TextStyle(color: Colors.black54))),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // ✅ Save
  void save() {
    String name = exerciseNameController.text.trim();
    if (name.isEmpty) return;

    String emojiName = "${getEmoji(name)}$name";
    Provider.of<WorkoutData>(context, listen: false).addExercise(
      widget.workoutName,
      emojiName,
      weightController.text,
      repsController.text,
      setsNameController.text,
    );

    Navigator.pop(context);
    clear();
  }

  // Cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    exerciseNameController.clear();
    weightController.clear();
    repsController.clear();
    setsNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color(0xFFE8E8E8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE8E8E8),
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.workoutName,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: createNewEcxercise,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: value.numberOfExercisesInWorkout(widget.workoutName),
          itemBuilder: (context, index) {
            final exercise = value.getRelevantWorkout(widget.workoutName).exercises[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: exercise.isCompleted,
                    onChanged: (val) => onCheckBoxChanged(widget.workoutName, exercise.name),
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exercise.name,
                          style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${exercise.weight} kg• ${exercise.sets} sets • ${exercise.reps} reps",
                          style: const TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}