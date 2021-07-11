import 'package:fitme/widgets/next_step.dart';

List<List<NextStep>> nextStepss = [
  // chest
  [
    NextStep(
      image: 'assets/images/image005.jpg',
      title: 'Plank',
      seconds: 50,
    ),
    NextStep(
      image: 'assets/images/image006.jpg',
      title: 'Push-ups',
      seconds: 50,
    ),
    NextStep(
      image: 'assets/images/image007.jpg',
      title: 'Lateral Raise',
      seconds: 50,
    ),
  ],

  // core
  [
    NextStep(image: 'assets/images/burpee.jpg', title: 'Burpees', seconds: 50),
    NextStep(image: 'assets/images/situp.jpg', title: 'Sit Ups', seconds: 50),
    NextStep(image: 'assets/images/crunch.jpg', title: 'Crunches', seconds: 50),
  ],

  // legs
  [
    NextStep(image: 'assets/images/squat.jpg', title: 'Squats', seconds: 50),
    NextStep(image: 'assets/images/lunges.jpg', title: 'Lunges', seconds: 50),
    NextStep(
        image: 'assets/images/jumpingjacks.jpg',
        title: 'Jumping Jacks',
        seconds: 50),
  ]
];
