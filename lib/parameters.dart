

class Parameters{
  int id;
  String paraD;
  String paraE;
  String paraG;
  String paraH;
  String paraI;
  String paraJ;
  String paraK;
  String paraL;
  String paraO;
  String paraP;
  String paraQ;

  Parameters(this.id, this.paraD,this.paraE,this.paraG,this.paraH,this.paraI,this.paraJ,this.paraK,this.paraL,this.paraO,this.paraP,this.paraQ);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'D': paraD,
      'E': paraE,
      'G': paraG,
      'H': paraH,
      'I': paraI,
      'J': paraJ,
      'K': paraK,
      'L': paraL,
      'O': paraO,
      'P': paraP,
      'Q': paraQ,
    };
    return map;
  }

  Parameters.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    paraD = map['D'];
    paraE = map['E'];
    paraG = map['G'];
    paraH = map['H'];
    paraI = map['I'];
    paraJ = map['J'];
    paraK = map['K'];
    paraL = map['L'];
    paraO = map['O'];
    paraP = map['P'];
    paraQ = map['Q'];
  }
}
