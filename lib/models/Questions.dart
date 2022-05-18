class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}
// 1 cant feel my face
// 2 adventure of a lifetime
// 3 i want to know what love is
// 4 lose yourself
// 5 uptown funk

const List sample_data = [
  {
    "id": 1,
    "question": "What is the name of this 2015 song?",
    "options": [
      "Can't Feel My Face ",
      'Call Out My Name',
      'Starboy',
      'See You Again'
    ],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "What is the name of this song by Coldplay?",
    "options": [
      'Higher Power',
      'Hymn for the Weekend',
      'Yellow',
      'Adventure of a Lifetime'
    ],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "Which band sings this song?",
    "options": [
      'Toto',
      'Queen',
      'Foreigner',
      'Journey',
    ],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What is the name of the song that won Eminem an Oscar?",
    "options": [
      'Lose Thyself',
      'Lose Yourself',
      'Epic Eminem Song',
      'Slim Shady'
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Who sings this song?",
    "options": [
      'Adam Levine',
      'Bruno Mars',
      'Justin Bieber',
      'Pharrell',
    ],
    "answer_index": 1,
  },
];
