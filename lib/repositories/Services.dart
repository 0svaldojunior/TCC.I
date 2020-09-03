//Flutter imports

//Packages App imports
import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  // instance of firestore
  Firestore _db;

  // user atributtes
  String _name;
  int _age;
  String _mail;
  String _dateBirth;

  // question atributtes
  String _question;
  String _dateAnswer;
  int _answer;

  // structs of application
  Map<dynamic, dynamic> _usersID;
  Map<dynamic, dynamic> _questionsID;
  DateTime _currentTime;
  Timestamp _currentTimeStamp;


  Services() {
    //firestore
    _db = Firestore.instance;

    //user
    _name = "";
    _age = 0;
    _mail = "";
    _dateBirth = "";

    //question
    _question = "";
    _dateAnswer = "";
    _answer = 0;

  // structs of application
    _usersID = new Map();
    _questionsID = new Map();
    _currentTime = DateTime.now();
    _currentTimeStamp = Timestamp.fromDate(_currentTime);
  }

  void makeUser() {
    Object object = {
      "name" : _name,
      "age" : _age,
      "mail" : _mail,
      "dateBirth" : _dateBirth
    };
    String collectionName = "users";// nome da tabela
    _insertionUser(_db, collectionName, object);
  }

  void makeQuestion() {
    _dateAnswer = _currentTimeStamp as String;
    Object object = {
      "question" : _question,
      "dateAnswer" : _dateAnswer,
      "answer" : _answer
      /**
       * Desafio, colocar o id do usuario(key of map usersID) como parametro da question
       * O que não se pode fazer:
       *  -> modificar os metodos publicos makeuser() e makeQuestion()
       *  a nivel paramétrico, ou seja adicionar parametros.
       *  -> utilizar metodos privados, adicione _ antes do nome
       * 
       * Dica: criar um metodo privado que receba o usuario e a questao, logo após
       * o linkar o usuario com a questao, chame este método dentro de makeQuestion,
       * tal metodo pode retornar a key do usuario para realizar o filto.
       * 
       * LEMBRETE: o Map esta organizado em Map<key, object>
       *    -> key = codigo de indentificacao gerado altomaticamente pelo firebase
       *    -> object = todas as informações do usuário 
       */
    };
    String collectionName = "question"; // nome da tabela
    _insertionQuestion(_db, collectionName, object);
  }

  void listSpecificUser(String document) async {
    String collectionName = "users";
    DocumentSnapshot snapshot = await _db.collection(collectionName).document(document).get();

    print("Specifc User List: $document");
    print("${snapshot.data.toString()}");
  }

  void listAllUsers() async {
    String collectionName = "users";
    QuerySnapshot querySnapshot = await _db.collection(collectionName).getDocuments();

    print("All Users List: ");
    for( DocumentSnapshot user in querySnapshot.documents ) {
      var data = user.data;
      print("${data.toString()}\n");
    }
  }

  /**
   * Desafio1: Implementar a listagem de todas as questões.
   * Desafio2: Implementar a listagem de uma questão específica.
   */

  void setData(Firestore db, String collectionName,String document, Object newObject) {
    db.collection(collectionName).document(document).setData(newObject);
    /**
     * O que faz: atualiza os dados de um determinado document(ID).
     * 
     * collectionName = possui o nome da colecao.
     * document = seria nossa key(ID) do documento
     * newObject = novas informacoes do documento
     */
  }

  void deleteDocumentInformations(Firestore db, String collectionName, String document) {
    db.collection(collectionName).document(document).delete();
    /**
     * O que faz: remove os dados de um document(ID)
     * 
     * collectionName = possui o nome da colecao.
     * document = seria nossa key(ID) do documento
     * 
     * OBSERVAÇÃO: caso raro mais possivel, caso queiramos remover uma colecao global deve ser realizada pelo console do firebase
     */
  }

  void _insertionUser(Firestore db, String collectionName, Object object)  async{
    DocumentReference reference = await db.collection(collectionName).add(object);

    var map = Map();
    map[reference.documentID] = object;
    _usersID.addAll(map);
    //print("Referencia: ${reference.documentID}");
  }

  void _insertionQuestion(Firestore db, String collectionName, Object object)  async{
  DocumentReference reference = await db.collection(collectionName).add(object);

  var map = Map();
  map[reference.documentID] = object;
  _questionsID.addAll(map);
  //print("Referencia: ${reference.documentID}");
  }

  //Seters
  void setName(String newName) { _name = newName; }
  void setMail(String newMail) { _mail = newMail; }
  void setDateBirth(String newDateBirth) { _dateBirth = newDateBirth; }
  void setDateAnswer(String newDateAnswer) { _dateAnswer = newDateAnswer; }
  void setQuestion(String newQuestion) { _question = newQuestion; }
  void setAge(int newAge) { _age = newAge; }
  void setAnswer(int newAnswer) { _answer = newAnswer; }

  //Getters
  String getName() { return _name; }
  String getMail() { return _mail; }
  String getDateBirth() { return _dateBirth; }
  String getDateAnswer() { return _dateAnswer; }
  String getQuestion() { return _name; }
  int getAge() { return _age; }
  int getAnswer() { return _answer; }
}