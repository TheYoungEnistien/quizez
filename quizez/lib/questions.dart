class Question {
  String q = '';
  bool a = false;
  String img = "";

  Question({required question, required image, required answer}) {
    this.q = question;
    this.img = image;
    this.a = answer;
  }
}
