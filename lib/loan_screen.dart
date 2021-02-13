import 'package:flutter/material.dart';
import 'package:flutter_apps/model/loan.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class LoanScreen extends StatefulWidget {

  const LoanScreen({Key key, @required this.loan}) : super(key: key);
  final Loan loan;

  @override
  _LoanScreenState createState() => _LoanScreenState(loan);
}

class _LoanScreenState extends State<LoanScreen> {
  _LoanScreenState(this.loan);
  Loan loan;
  double _currentValue = 0.0;
  double _tenureValue = 0.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
      amount: 3243243
  );

  @override
  void initState() {
    print('data from home= ${loan.toString()}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[900],
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: _appBar()
      ),
      body: _body(),
    );
  }

  Widget _appBar(){
    return AppBar(
      title: Text(
        'Loan',
        style: TextStyle(
            color: Colors.amber[100]
        ),
      ),
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Colors.white60,)
      ),
      centerTitle: true,
      backgroundColor: Colors.grey[850],
      elevation: 0,
    );
  }

  Widget _body(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        children: <Widget>[
          Card(
            semanticContainer: true,
            elevation: 2,
            color: Colors.white10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(loan.title, style: TextStyle(
                                color: Colors.amber[400],
                                fontSize: 20.0),
                            ),
                            Text('Request by ${loan.by}', style: TextStyle(
                                color: Colors.amber[200],
                                fontSize: 12.0
                            ),)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Total', style: TextStyle(
                                color: Colors.amber[200],
                                fontSize: 12.0),
                            ),
                            Text('${loan.amount.toInt()}', style: TextStyle(
                              color: Colors.amber[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Text('Amount', style: TextStyle(
                      color: Colors.amber[200],
                      fontSize: 15.0),
                  ),
                  const SizedBox(height: 10,),
                  Text('\$${_currentValue.toInt()}', style: TextStyle(
                      color: Colors.amber[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.blue[900],
                      thumbColor: Colors.blue[700],
                      trackHeight: 4.0,
                      // inactiveTrackColor: Colors.indigo,
                      // trackShape: RoundedRectSliderTrackShape(),
                      // overlayColor: Colors.indigo
                    ),
                    child: Slider(
                        value: _currentValue,
                        min: 0,
                        max: loan.amount,
                        divisions: 10,
                        // label: 'Test',
                        onChanged: (double value) {
                          setState(() {
                            _currentValue = value;
                          });
                        }),
                  ),
                  const SizedBox(height: 10,),
                  Text('Your money will be return in ${loan.tenure.toInt()} months with interest of 10%',
                    style: TextStyle(
                        color: Colors.amber[200],
                        fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25,),
          RaisedButton(
              padding: const EdgeInsets.all(15),
              textColor: Colors.black,
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: const Text('Estimate Payment Back', style: TextStyle(
                fontSize: 20,
              ),),
              onPressed: (){
                print(_currentValue);
                if (_currentValue == 0.0){
                  _showSnackBar(context);
                  return;
                }
                _tenureValue = _currentValue * 1.1;
                _modalBottomSheetMenu();
              }
          )
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    // final ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar = Scaffold.of(context).showSnackBar(const SnackBar(
    //   behavior: SnackBarBehavior.floating,
    //   content: Text('Please select the amount'),
    // ));
    final SnackBar snackBar =  SnackBar(
        backgroundColor: Colors.grey[600],
        behavior: SnackBarBehavior.floating,
        content: const Text('Please select the amount', style: TextStyle(
            color: Colors.amber
        ),));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _modalBottomSheetMenu(){
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.grey[850],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )
        ),
        builder: (BuildContext builder){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      height: 5.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(Radius.circular(20.0))
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text('The amount you lending',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.amber[100],
                                  fontSize: 13.0),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('\$${_currentValue.toInt()}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.amber[400],
                                  fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 15,
                        thickness: 0.5,
                        color: Colors.amber[50],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text('Loan term',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.amber[100],
                                  fontSize: 13.0),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('${loan.tenure.toInt()} M',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.amber[400],
                                  fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 15,
                        thickness: 0.5,
                        color: Colors.amber[50],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                          child: Text('Estimated money you will get',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.amber[100],
                                fontSize: 15.0),
                          ),
                        ),
                      ),
                      Center(
                        child: Text('\$${_tenureValue.toInt()}',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.amber[400],
                              fontSize: 35.0),
                        ),
                      )
                    ],
                  ),
                ]
            ),
          );
        }
    );
  }
}

/*Card(
            margin: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
            semanticContainer: true,
            elevation: 2,
            color: Colors.white10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: <Widget>[

                  Text('Select Loan Tenure', style: TextStyle(
                      color: Colors.amber[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 10.0),
                    child: Text('Move the slider to select collateral term in months.', style: TextStyle(
                        color: Colors.amber[100],
                        fontSize: 13.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text('${_tenureValue.toInt()} months', style: TextStyle(
                      color: Colors.amber[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.blue[900],
                      thumbColor: Colors.blue[700],
                      trackHeight: 4.0,
                      // inactiveTrackColor: Colors.indigo,
                      // trackShape: RoundedRectSliderTrackShape(),
                      // overlayColor: Colors.indigo
                    ),
                    child: Slider(
                        value: _tenureValue,
                        min: 0,
                        max: loan.tenure,
                        // label: 'Test',
                        onChanged: (double value) {
                          setState(() {
                            _tenureValue = value;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),*/