# FitRugby

A Flutter fitness app for rugby players. Players set up a profile with their playing position, height and weight, then follow pre-built or online workout programmes and track their progress in reports.

There is a companion admin site, [FitRugby-web](https://github.com/Paradox2405/FitRugby-web), where coaches create workouts.

## Features

- Profile setup: name, playing position, height (cm) and weight (kg)
- **Pre-built workout programmes** by workout type, with reps, time and a completion indicator
- **Online workouts** created by admins on the web dashboard
- **Reports**: workout history by date and duration, plus programme completion
- Email/password and Google sign-in

## Tech stack

- **Flutter** (Dart) with **GetX** (page, controller and binding per feature)
- **Firebase Authentication** and Google Sign-In
- `percent_indicator`, `flutter_staggered_grid_view`

## Project structure

```
lib/
  welcome/ login/ registration/ profilesetup/ profilepage/
  home/              home page and bottom navigation
  workouttype/       choose a workout type
  prebuiltworkout/   pre-built programmes
  onlineworkout/     workouts from the web dashboard
  reports/           progress reports
  models/            workout, report and colour models
  routes/            route table
```

## Getting started

1. Add your Firebase config files and enable Email/Password and Google sign-in.
2. Run:
   ```bash
   flutter pub get
   flutter run
   ```

> Built in 2022. Upgrade the Firebase plugins before building with a current Flutter SDK.
