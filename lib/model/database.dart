class DataBaseSystem{
  dynamic loannumber = '';
  dynamic loanamount= '';
  dynamic totaldue= '';
  dynamic termdays= '';
  dynamic birthdate= '';
  dynamic bank_account_type_1= '';
  dynamic bank_account_type_2= '';
  dynamic bank_account_type_3= '';
  dynamic bank_account_type_4= '';
  dynamic bank_name_clients= '';
  dynamic employment_status_clients_1= '';
  dynamic employment_status_clients_2= '';
  dynamic employment_status_clients_3= '';
  dynamic employment_status_clients_4= '';
  dynamic employment_status_clients_5= '';
  dynamic employment_status_clients_6= '';
  dynamic employment_status_clients_7= '';
  dynamic level_of_education_clients_1= '';
  dynamic level_of_education_clients_2= '';
  dynamic level_of_education_clients_3= '';
  dynamic level_of_education_clients_4= '';
  dynamic level_of_education_clients_5= '';
  dynamic daily_rate= '';
  dynamic hour_of_creation= '';
  dynamic hour_of_approval= '';
  dynamic count= '';
  dynamic sum= '';
  dynamic amount_difference = '';


  void parseScreenOneData(Map<String,dynamic> data){
    employment_status_clients_1 = data['employment_status'][0];
    employment_status_clients_2= data['employment_status'][1];
    employment_status_clients_3= data['employment_status'][2];
    employment_status_clients_4= data['employment_status'][3];
    employment_status_clients_5= data['employment_status'][4];
    employment_status_clients_6= data['employment_status'][5];
    employment_status_clients_7= data['employment_status'][6];
    bank_account_type_1= data['accountType'][0];
    bank_account_type_2= data['accountType'][1];
    bank_account_type_3= data['accountType'][2];
    bank_account_type_4= data['accountType'][3];
    level_of_education_clients_1= data['education'][0];
    level_of_education_clients_2= data['education'][1];
    level_of_education_clients_3= data['education'][2];
    level_of_education_clients_4= data['education'][3];
    level_of_education_clients_5= data['education'][4];
    bank_name_clients= data['bankName'];
    birthdate=data['age'];
  
  }


  void parseScreenTwoData(Map<String,dynamic> data){
    termdays = data['termsDay'];
    loannumber = data['currentNumberloans'];
    loanamount= data['loanAmount'];
    totaldue= data['loanDues'];
    count= data['previousNumberLoans'];
    sum= data['totalAmount'];
    daily_rate = dailyInterestRate(loanamount,totaldue,termdays);
    amount_difference = percentageDifferenceInloanBorrowed(loanamount, sum, count);
    hour_of_creation= mapHours(data['createdDate']);
    hour_of_approval= mapHours(data['approvedDate']);
  }

  int mapHours(int hourOfTheDay){
    if([0,1,2,3,4,5].contains(hourOfTheDay)){
      return 0;
    }
    else if([6,7,8,9,10,11,12].contains(hourOfTheDay)){
      return 1;
    }
    else if([13,14,15,16].contains(hourOfTheDay)){
      return 2;
    }
    return 3;
  }
  
  double percentageDifferenceInloanBorrowed(int borrowedLoan, int pastLoans, int numberOfPastloans){
    try{
      double meanAmountBorrowedPerloan = pastLoans/numberOfPastloans;
      double loanDiff = borrowedLoan - meanAmountBorrowedPerloan;
      double percentageDiff = (loanDiff/borrowedLoan) * 100;
        return percentageDiff;
    }
    catch (e){
      return 0;
    }
  }

  double dailyInterestRate(int loanAmount, int totalDue, int termDays){
    double interestRate = ((loanAmount -totalDue)/totalDue) * 100;
    double dailyRate = interestRate/termDays;
    return dailyRate;
  }

  void standardScaler(){
    List<dynamic> items = [loannumber,loanamount,totaldue,termdays,birthdate,daily_rate,
                          hour_of_creation,hour_of_approval,count,sum,amount_difference];
  }
}

class experimentingDatabase{
  DataBaseSystem appBase = DataBaseSystem();

  void storeScreenOne(Map<String,dynamic> data){
    appBase.parseScreenOneData(data);
  }
  
  void storeScreenTwo(Map<String,dynamic> data){
    appBase.parseScreenTwoData(data);
  }
}