// Flutter imports

// App packages imports
import 'package:AgesMental/repositories/Services.dart';

class Linker {

  Services service;

  Linker() {
    service = new Services();
    // addUser("Osvaldo Junior", "osvaldo.rodrigues@acad.pucrs.br", "01/02/1997", 23);
    // addQuestion("Como você está se sentindo agora?", "05/04/2020", 4);
    // addUser("Joao", "joao.etchiury@gmail.com", "01/01/1999", 21);
    // addQuestion("Como foi sua noite?", "05/04/2020", 5);
    //addUser("Choma", "choma@pucrs.br", "05/04/2020", 22);

    listAllUsers();

    /**
     * Desafio: Selecionar um usuário específico.
     * Dica: crie um metodo em Services para buscar usuário, existem formas de aplicar um filtro nos MAP's
     */
    listSpecifcUser("FocA1kZyf8ZiuQJrDotQ");
  }

  void listAllUsers() {
    service.listAllUsers();
  }

  void listSpecifcUser(String document) {
    service.listSpecificUser(document);
  }

  void addUser(String newName, String newMail, String newBirth, int newAge) {
    service.setName(newName);
    service.setMail(newMail);
    service.setDateBirth(newBirth);
    service.setAge(newAge);
    
    service.makeUser();
  }

  void addQuestion(String newQuestion, String newDateAnswer, int newAnswer) {
    service.setQuestion(newQuestion);
    service.setDateAnswer(newDateAnswer);
    service.setAnswer(newAnswer);

    service.makeQuestion();
  }
}