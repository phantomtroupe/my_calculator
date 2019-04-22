import 'dart:collection';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double memory, result;
  String currentOperation, history;

  @override
  void initState() {
    super.initState();
    memory = 0.0;
    result = 0.0;
    currentOperation = "";
    history = "";
  }

  void btnNumberAndOperationClick(String param) {
    if (currentOperation == "") {
      if (param != "+" && param != "/" && param != "x" && param != "-") {
        setState(() {
          currentOperation += param;
        });
      }
    } else {
      String lastChar = currentOperation == ""
          ? ""
          : currentOperation[currentOperation.length - 1];
      if (currentOperation.length == 1) {
        setState(() {
          currentOperation += param;
        });
      } else if (lastChar == "x" ||
          lastChar == "-" ||
          lastChar == "+" ||
          lastChar == "/") {
        if (param != "x" && param != "-" && param != "+" && param != "/") {
          setState(() {
            currentOperation += param;
          });
        } else {
          String newString =
              currentOperation.substring(0, currentOperation.length - 1) +
                  param;
          setState(() {
            currentOperation = newString;
          });
        }
      } else if (param != ".") {
        setState(() {
          currentOperation += param;
        });
      } else {
        if (lastChar != "." && !currentOperation.contains(".")) {
          setState(() {
            currentOperation += param;
          });
        }
      }
    }
  }

  void btnAcclick() {
    setState(() {
      currentOperation = "";
      history = "";
    });
  }

  void btnBackSpaceClisk() {
    if (currentOperation.length > 1) {
      setState(() {
        currentOperation =
            currentOperation.substring(0, currentOperation.length - 1);
      });
    } else {
      if (history != "") {
        setState(() {
          currentOperation = history;
          history = "";
        });
      } else {
        setState(() {
          currentOperation = "";
        });
      }
    }
  }

  void btnPlusMinus() {
    if (currentOperation != "") {
      if (currentOperation.length == 1) {
        currentOperation = "(-$currentOperation)";
      } else {
        if (currentOperation[currentOperation.length - 1] == ")") {
          List<String> number = new List<String>();
          for (int i = currentOperation.length - 2; i > 0; i--) {
            if (currentOperation[i] != "-") {
              number.add(currentOperation[i]);
            } else {
              break;
            }
          }
          currentOperation = currentOperation.substring(
                  0, currentOperation.length - number.length - 3) +
              number.reversed.join();
        } else {
          List<String> number = new List<String>();
          for (int i = currentOperation.length - 1; i >= 0; i--) {
            if (currentOperation[i] != "-" &&
                currentOperation[i] != "+" &&
                currentOperation[i] != "x" &&
                currentOperation[i] != "/") {
              number.add(currentOperation[i]);
            } else {
              break;
            }
          }
          currentOperation =
              "${currentOperation.substring(0, currentOperation.length - number.length)}(-${number.reversed.join()})";
        }
      }
      setState(() {});
    }
  }

  void btnResult() {
    List<String> output = new List<String>();
    List<String> symbol = new List<String>();
    String input = currentOperation;
    if (currentOperation.length != 1) {
      for (int i = 0; i < input.length; i++) {
        if (isNumeric(input[i])) {
          if (i + 1 == input.length) {
            output.add(input[i]);
          } else {
            if (input[i + 1].contains(".")) {
              String number = "";
              int indexPassed = 0;
              while (i + indexPassed != input.length) {
                if(input[i + indexPassed] != "x" &&
                  input[i + indexPassed] != "/" &&
                  input[i + indexPassed] != "+" &&
                  input[i + indexPassed] != "-"){
                    number += input[i + indexPassed];
                    indexPassed += 1;
                  }else{
                    break;
                  }
              }

              output.add(number);
              i += indexPassed - 1;
            } else {
              String val = "";
              int indexPassed = 0;
              for(int j = i; j < input.length; j++){
                if(input[j] != "x" && input[j] != "/" && input[j] != "+" && input[j] != "-"){
                  val += input[j];
                }else{
                  indexPassed += j;
                  break;
                }
              }
              i += indexPassed - 1;
              output.add(val);
            }
          }
        } else {
          if (input[i] == "+" ||
              input[i] == "-" ||
              input[i] == "x" ||
              input[i] == "/") {
            if (symbol.length == 0) {
              symbol.add(input[i]);
            } else {
              if (symbol[symbol.length - 1] == "x" ||
                  symbol[symbol.length - 1] == "/" ||
                  symbol[symbol.length - 1] == "^") {
                output.add(symbol[symbol.length - 1]);
                symbol.removeLast();
                symbol.add(input[i]);
              } else {
                symbol.add(input[i]);
              }
            }
          } else if (input[i] == "(") {
            String number = "u";
            int indexPassed = 2;
            while (input[i + indexPassed] != ")") {
              number += input[i + indexPassed];
              indexPassed += 1;
            }

            output.add(number);
            i += indexPassed;
          }
        }
      }
    }

    List<String> result = new List<String>();
    result.addAll(output);
    result.addAll(symbol.reversed);
    print(result);
    List<double> number = new List<double>();
    for(int i = 0; i < result.length; i++){
      if(isNumeric(result[i]) || result[i].contains("u")){
        if(result[i].contains("u")){
          double negateNumber = double.parse(result[i].substring(1,result[i].length));
          number.add(negateNumber * -1);
        }else{
          number.add(double.parse(result[i]));
        }
      }else{
        double val = 0;
        switch(result[i]){
          case "/" :
            val = number[number.length - 2] / number[number.length - 1];
            number.removeLast();
            number.removeLast();
            number.add(val);
            break;
          case "x" :
            val = number[number.length - 2] * number[number.length - 1];
            number.removeLast();
            number.removeLast();
            number.add(val);
            break;
          case "+" :
            val = number[number.length - 2] + number[number.length - 1];
            number.removeLast();
            number.removeLast();
            number.add(val);
            break;
          case "-" :
            val = number[number.length - 2] - number[number.length - 1];
            number.removeLast();
            number.removeLast();
            number.add(val);
            break;  
        }
      }
    }

    setState(() {
      history = currentOperation;
     if(int.parse(number[0].toString().split(".")[1]) == 0){
       currentOperation = number[0] < 0 ? "(${number[0].toInt()})" : number[0].toInt().toString();
     }else{
       currentOperation = number[0] < 0 ? "(${number[0]})" : number[0].toString();
     }
    });
  }

  bool isNumeric(String s) {
    if (s == null) {
      return null;
    } else {
      return double.parse(s, (e) => null) != null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: MediaQuery.of(context).padding,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              child: ListView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Text(
                    "$history",
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    currentOperation,
                    style: TextStyle(fontSize: 45.0),
                  ),
                )),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border(
                            top:
                                BorderSide(color: Colors.grey[300], width: 1.0),
                            right: BorderSide(
                                color: Colors.grey[300], width: 1.0))),
                    child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {},
                      child: Text("mc", style: TextStyle(fontSize: 25.0)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border(
                            top:
                                BorderSide(color: Colors.grey[300], width: 1.0),
                            right: BorderSide(
                                color: Colors.grey[300], width: 1.0))),
                    child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {},
                      child: Text("m+", style: TextStyle(fontSize: 25.0)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border(
                            top:
                                BorderSide(color: Colors.grey[300], width: 1.0),
                            right: BorderSide(
                                color: Colors.grey[300], width: 1.0))),
                    child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {},
                      child: Text("m-", style: TextStyle(fontSize: 25.0)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border(
                            top:
                                BorderSide(color: Colors.grey[300], width: 1.0),
                            right: BorderSide(
                                color: Colors.grey[300], width: 1.0))),
                    child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {},
                      child: Text("mr", style: TextStyle(fontSize: 25.0)),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnAcclick();
                        },
                        child: Text("AC",
                            style: TextStyle(
                                fontSize: 35.0, color: Colors.orange)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnBackSpaceClisk();
                        },
                        child: Icon(
                          Icons.backspace,
                          color: Colors.orange,
                          size: 35.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnPlusMinus();
                        },
                        child: Text("+/-", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("/");
                        },
                        child: Text("/", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("7");
                        },
                        child: Text("7", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("8");
                        },
                        child: Text("8", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("9");
                        },
                        child: Text("9", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("x");
                        },
                        child: Text("x", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("4");
                        },
                        child: Text("4", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("5");
                        },
                        child: Text("5", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("6");
                        },
                        child: Text("6", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("-");
                        },
                        child: Text("-", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("1");
                        },
                        child: Text("1", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("2");
                        },
                        child: Text("2", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("3");
                        },
                        child: Text("3", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("+");
                        },
                        child: Text("+", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick("0");
                        },
                        child: Text("0", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnNumberAndOperationClick(".");
                        },
                        child: Text(".", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                              right: BorderSide(
                                  width: 1.0, color: Colors.grey[300]))),
                      child: FlatButton(
                        onPressed: () {
                          btnResult();
                        },
                        child: Text("=", style: TextStyle(fontSize: 35.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
