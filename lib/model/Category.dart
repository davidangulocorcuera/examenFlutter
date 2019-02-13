//{"category":"Entertainment: Comics","type":"multiple","difficulty":"easy","question":"Who is"
//" the creator of the comic series &quot;The Walking Dead&quot;?",
//"correct_answer":"Robert Kirkman","incorrect_answers":["Stan Lee","Malcolm Wheeler-Nicholson","Robert Crumb"]}

class Category{
    String question;
    String correct_answer;
    List<dynamic> incorrect_answers;

    Category(this.question,this.correct_answer,this.incorrect_answers);
}