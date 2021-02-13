class Loan {
  Loan({this.title, this.description, this.amount, this.tenure, this.requirement, this.by});
  String title;
  String description;
  double amount;
  double tenure;
  String requirement;
  String by;

  Loan.n() : amount = defaultX;

  static double get defaultX => 0;

  @override
  String toString() {
    return 'Loan: '
        '{title: $title, '
        'description: $description, '
        'amount: $amount, '
        'tenure: $tenure '
        'requirement: $requirement '
        'by: $by';
  }
}