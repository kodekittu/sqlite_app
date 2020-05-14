import 'package:flutter/material.dart';
import 'parameters.dart';
import 'dart:async';
import 'db_helper.dart';

class DBTestPage extends StatefulWidget {
  final String title;

  DBTestPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DBTestPageState();
  }
}

class _DBTestPageState extends State<DBTestPage> {
  //
  Future<List<Parameters>> parameters;
  TextEditingController controllerD = TextEditingController();
  TextEditingController controllerE = TextEditingController();
  TextEditingController controllerG = TextEditingController();
  TextEditingController controllerH = TextEditingController();
  TextEditingController controllerI = TextEditingController();
  TextEditingController controllerJ = TextEditingController();
  TextEditingController controllerK = TextEditingController();
  TextEditingController controllerL = TextEditingController();
  TextEditingController controllerO = TextEditingController();
  TextEditingController controllerP = TextEditingController();
  TextEditingController controllerQ = TextEditingController();
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
  int curId;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      parameters = dbHelper.getParameters();
    });
  }

  clearName() {
    controllerD.text = '';
    controllerE.text = '';
    controllerG.text = '';
    controllerH.text = '';
    controllerI.text = '';
    controllerJ.text = '';
    controllerK.text = '';
    controllerL.text = '';
    controllerO.text = '';
    controllerP.text = '';
    controllerQ.text = '';
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        Parameters x = Parameters(curId, paraD,paraE,paraG,paraH,paraI,paraJ,paraK,paraL,paraO,paraP,paraQ);
        dbHelper.update(x);
        setState(() {
          isUpdating = false;
        });
      } else {
        Parameters e = Parameters(null, paraD,paraE,paraG,paraH,paraI,paraJ,paraK,paraL,paraO,paraP,paraQ);
        dbHelper.save(e);
      }
      clearName();
      refreshList();
    }
  }

  form() {
    MediaQueryData data = MediaQuery.of(context);
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          height:  data.size.height * 0.45,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      width: data.size.width * 0.3,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: controllerD,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(labelText: 'D'),
                            validator: (val) => val.length == 0 ? 'Enter Value' : null,
                            onSaved: (val) => paraD = val,
                          ),
                          TextFormField(
                            controller: controllerE,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(labelText: 'E'),
                            validator: (val) => val.length == 0 ? 'Enter Value' : null,
                            onSaved: (val) => paraE = val,
                          ),
                          TextFormField(
                            controller: controllerG,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(labelText: 'G'),
                            validator: (val) => val.length == 0 ? 'Enter Value' : null,
                            onSaved: (val) => paraG = val,
                          ),
                          TextFormField(
                            controller: controllerH,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(labelText: 'H'),
                            validator: (val) => val.length == 0 ? 'Enter Value' : null,
                            onSaved: (val) => paraH = val,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: data.size.width * 0.3,
                      child: Column(children: <Widget>[
                        TextFormField(
                          controller: controllerI,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: 'I'),
                          validator: (val) => val.length == 0 ? 'Enter Value' : null,
                          onSaved: (val) => paraI = val,
                        ),
                        TextFormField(
                          controller: controllerJ,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: 'J'),
                          validator: (val) => val.length == 0 ? 'Enter Value' : null,
                          onSaved: (val) => paraJ = val,
                        ),
                        TextFormField(
                          controller: controllerK,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: 'K'),
                          validator: (val) => val.length == 0 ? 'Enter Value' : null,
                          onSaved: (val) => paraK = val,
                        ),
                        TextFormField(
                          controller: controllerL,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: 'L'),
                          validator: (val) => val.length == 0 ? 'Enter Value' : null,
                          onSaved: (val) => paraL = val,
                        ),
                      ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: data.size.width * 0.3,
                      child: Column(children: <Widget>[
                        TextFormField(
                          controller: controllerO,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: 'O'),
                          validator: (val) => val.length == 0 ? 'Enter Value' : null,
                          onSaved: (val) => paraO = val,
                        ),
                        TextFormField(
                          controller: controllerP,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: 'P'),
                          validator: (val) => val.length == 0 ? 'Enter Value' : null,
                          onSaved: (val) => paraP = val,
                        ),
                        TextFormField(
                          controller: controllerQ,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: 'Q'),
                          validator: (val) => val.length == 0 ? 'Enter Value' : null,
                          onSaved: (val) => paraQ = val,
                        ),
                      ],),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      onPressed: validate,
                      child: Text(isUpdating ? 'UPDATE' : 'ADD'),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          isUpdating = false;
                        });
                        clearName();
                      },
                      child: Text('CANCEL'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView dataTable(List<Parameters> parameters) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('D'),
          ),
          DataColumn(
            label: Text('E'),
          ),
          DataColumn(
            label: Text('G'),
          ),
          DataColumn(
            label: Text('H'),
          ),
          DataColumn(
            label: Text('I'),
          ),
          DataColumn(
            label: Text('J'),
          ),
          DataColumn(
            label: Text('K'),
          ),
          DataColumn(
            label: Text('L'),
          ),
          DataColumn(
            label: Text('O'),
          ),
          DataColumn(
            label: Text('P'),
          ),
          DataColumn(
            label: Text('Q'),
          ),
          DataColumn(
            label: Text('X',style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
          ),
        ],
        rows: parameters
            .map(
              (parameter) => DataRow(cells: [
                DataCell(
                  Text(parameter.paraD),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerD.text = parameter.paraD;
                  },
                ),
                DataCell(
                  Text(parameter.paraE),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerE.text = parameter.paraE;
                  },
                ),
                DataCell(
                  Text(parameter.paraG),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerG.text = parameter.paraG;
                  },
                ),
                DataCell(
                  Text(parameter.paraH),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerH.text = parameter.paraH;
                  },
                ),
                DataCell(
                  Text(parameter.paraI),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerI.text = parameter.paraI;
                  },
                ),
                DataCell(
                  Text(parameter.paraJ),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerJ.text = parameter.paraJ;
                  },
                ),
                DataCell(
                  Text(parameter.paraK),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerK.text = parameter.paraK;
                  },
                ),
                DataCell(
                  Text(parameter.paraL),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerL.text = parameter.paraL;
                  },
                ),
                DataCell(
                  Text(parameter.paraO),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerO.text = parameter.paraO;
                  },
                ),
                DataCell(
                  Text(parameter.paraP),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerP.text = parameter.paraP;
                  },
                ),
                DataCell(
                  Text(parameter.paraQ),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      curId = parameter.id;
                    });
                    controllerQ.text = parameter.paraQ;
                  },
                ),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                dbHelper.delete(parameter.id);
                refreshList();
              },
            )),
          ]),
        )
            .toList(),
      ),
    );
  }

  list() {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: parameters,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }

          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text("No Data Found");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(),
      body: Container(
        child:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              form(),
              list(),
            ],
          ),
        ),
      ),
    );
  }
}
