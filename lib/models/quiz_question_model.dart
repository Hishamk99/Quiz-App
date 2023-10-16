class QuestionModel
{
  final String text;
  final List<String> answers;

  const QuestionModel({required this.text, required this.answers});
  
  // using shuffle() to put the elements in random order
  List<String> getShufflrdList()
  {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}