import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/model/loan.dart';

class LoanCard extends StatelessWidget {

  const LoanCard({this.loan,this.open});
  final Loan loan;
  final Function open;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => open(),
      child: SizedBox(
        height: 180,
        child: Card(
          semanticContainer: true,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          color: Colors.grey[850],
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Scaffold(
                    backgroundColor: Colors.grey[850],
                    bottomNavigationBar: Text(
                      loan.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.amber[200],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis
                    ),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          loan.title,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber[400],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 50.0,
                        // ),
                        Text(
                          loan.by,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.amber[200],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const VerticalDivider(
                //   width: 30,
                //   thickness: 1,
                //   color: Colors.grey,
                // ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(
                              'Amount',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.amber[100],
                              ),
                            ),
                            Text(
                              '\$${loan.amount}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.amber[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Loan Term',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.amber[100],
                              ),
                            ),
                            AutoSizeText(
                              '${loan.tenure.toInt()} Months',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.amber[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
