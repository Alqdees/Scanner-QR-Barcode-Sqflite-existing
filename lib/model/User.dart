

class User {
  // late int id;
   String? name ,barcode,cost,sell,dose,mostSide,drugName,mechanism,pregnancy;
  User();
  User.map(dynamic opj){
    this.name=opj["Name"];
    this.barcode=opj["BarCode"];
    this.cost=opj["Cost"];
    this.sell=opj["Sell"];
    // this.id=opj["ID"];
    this.dose=opj["dose"];
    this.mostSide=opj['mostSide'];
    this.drugName=opj['drugName'];
    this.pregnancy=opj['pregnancy'];
  }
  Map< String , dynamic > map(){
    var map =  Map<String,dynamic>();
    map['Name'] = name;
    map['BarCode'] = barcode;
    map['Cost'] = cost;
    map['Sell'] = sell;
    map['dose'] = dose;
    map['mostSide'] = mostSide;
    map['drugName'] = drugName;
    map['pregnancy'] = pregnancy;

    return map;
  }


}
