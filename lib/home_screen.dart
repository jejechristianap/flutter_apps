import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apps/helper/color.dart';
import 'package:flutter_apps/loan_screen.dart';
import 'package:flutter_apps/model/loan.dart';
import 'package:flutter_apps/model/loan_card.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
      amount: 12345678.9012345
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    final ConnectionStatusBar con = ConnectionStatusBar();
    print('${con.createState()}');
    super.initState();
  }

  void choiceAction(String choice){
    if(choice == 'Profile'){
      Navigator.pushNamed(context, '/profile');
    }
    if(choice == 'Login'){
      Navigator.pushNamed(context, '/login');
    }
    else if(choice == 'Logout'){
      SystemChannels.platform.invokeMethod<String>('SystemNavigator.pop');
    }
  }

  List<Loan> loanList = <Loan>[
    Loan(title: 'College',
        description: 'I need money for my tuition college, i\'ll repay the money within 5 months. '
            'I need the mones soon as possible', amount: 1000, tenure: 12, requirement: '5 month', by: 'John Doe'),
    Loan(title: 'Marriage',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
            'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        amount: 500, tenure: 6, requirement: '5 month', by: 'Sony. L'),
    Loan(title: 'Small Business',
        description: 'I need money to buy some stuff',
        amount: 1500, tenure: 12, requirement: '5 month', by: 'Cole'),
    Loan(title: 'Medical',
        description: 'I need money to buy some stuff',
        amount: 5000, tenure: 24, requirement: '5 month', by: 'Andrew'),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,
        backgroundColor: HexColor('121212'),
        appBar: AppBar(
          backgroundColor: HexColor('121212'),
          elevation: 0.0,
          title: Text('Lender',
            style: TextStyle(
                color: Colors.amber[100]
            ),
          ),
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.menu_outlined),
            color: Colors.white60,
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
            // onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          actions: <Widget>[
            _popMenu(),
          ],
          // centerTitle: true,
        ),
        body: _body(),
        drawer: _drawer()
    );
  }

  Widget _popMenu(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: PopupMenuButton<String>(
        color: Colors.grey[850],
        onSelected: choiceAction,
        itemBuilder: (BuildContext context){
          return <String>{'Profile', 'Login', 'Logout'}.map((String choice){
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
              textStyle: const TextStyle(color: Colors.white60),
            );
          }).toList();
        },
        child: const Icon(
          Icons.more_vert,
          color: Colors.white60,
        ),
      ),
    );
  }

  Widget _drawer(){
    return Theme(
      data: Theme.of(context).copyWith(
          dividerColor: Colors.amber,
          canvasColor: Colors.grey[900]),
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Simple Simulation by Jeje', style: TextStyle(
                  color: Colors.amber[100]
              ),),
              // decoration: BoxDecoration(
              //   color: Colors.grey[900],
              // ),
            ),
            ListTile(
              title: Text('History',style: TextStyle(
                  color: Colors.amber[100]
              ),),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Camera', style: TextStyle(
                  color: Colors.amber[100]
              ),),
              onTap: () {
                // Update the state of the app.
                // ...

              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(){
    return Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: loanList.map((Loan list) => LoanCard(
                  loan: list,
                  open: () {
                    setState(() {
                      print(list.title);
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) => LoanScreen(
                            loan: list,
                          )
                      )
                      );
                    });
                  }
              )).toList(),
              // <Widget>[
              //   Padding(
              //     padding: const EdgeInsets.all(12.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: loanList.map((Loan list) => LoanCard(
              //           loan: list,
              //           open: () {
              //             setState(() {
              //               print(list.title);
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute<void>(
              //                       builder: (BuildContext context) => LoanScreen(
              //                         loan: list,
              //                       )
              //                   )
              //               );
              //             });
              //           }
              //       )).toList(),
              //     ),
              //   ),
              // ],
            ),
          ),
          ConnectionStatusBar(
            title: const Text(
              'Mohon cek jaringan anda',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ]
    );
  }


}