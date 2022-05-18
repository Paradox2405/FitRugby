
class WorkoutModel {
   final int day;
   final String workout;
   final int sets;
   final int reps;
   final int calories;
   final List<WorkoutModel> subCategory;

  WorkoutModel({
    required this.day,
    required this.workout,
    required this.sets,
    required this.reps,
    required this.calories,
    required this.subCategory,
  });
}