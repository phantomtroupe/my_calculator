import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    "",
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
                    "",
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
