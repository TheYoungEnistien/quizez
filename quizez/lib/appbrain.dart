import 'package:quizez/questions.dart';

class Appbrain {
  int i = 0;
  List<Question> y = [
    Question(
        question: 'The number of planets in the solar system is 8.',
        image: 'images/image-1.jpg',
        answer: true),
    Question(
        question: 'A chicken can only lay one egg per day.',
        image: 'images/image-2.jpg',
        answer: false),
    Question(
        question: 'cats are carnivores',
        image: 'images/image-3.jpg',
        answer: true),
    Question(
        question: 'China is on the African continent.',
        image: 'images/image-4.jpg',
        answer: false),
    Question(
        question: 'The earth is flat, not spherical',
        image: 'images/image-5.jpg',
        answer: false),
    Question(
        question: 'Humans only eat vegetables.',
        image: 'images/image-6.jpg',
        answer: false),
    Question(
        question: 'Planet Mercury is closer to the sun than Earth',
        image: 'images/image-7.jpg',
        answer: true)
  ];
  void getnextpage() {
    if (i < y.length - 1) {
      i++;
    }
  }

  String getnextquestion() {
    return y[i].q;
  }

  String getnextimage() {
    return y[i].img;
  }

  bool getnextanswer() {
    return y[i].a;
  }

  bool isfinish() {
    if (i >= y.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    i = 0;
  }
}
