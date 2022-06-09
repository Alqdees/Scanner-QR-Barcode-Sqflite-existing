import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scanner_qr_barcode/Utils/DataBaseHelper.dart';
import 'package:scanner_qr_barcode/model/User.dart';



class  Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class  _HomeState extends State<Home> {

  User user = User();
  @override
  initState(){
    readData();
    super.initState();
  }
  bool isLoading = true;
  DataBaseHelper db = DataBaseHelper.dataBaseHelper;
  var users = [];

Future readData() async {
    List<Map> response =await db.readData("SELECT * FROM Ahmed");
    users.addAll(response);
    isLoading = false;
    if(mounted){
      setState((){});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 35.0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 150, 0, 72),
        title: const Text(
          'Scanner',
        ),
        leading:  IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 32.0,
          ),
        ),
        actions:  [
          IconButton(
              onPressed: () {} ,
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 32.0,
              )),
          IconButton(
              onPressed: () {} ,
              icon: const Icon(
                Icons.search,
                size: 32.0,
              )),
        ],
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () async {
            Navigator.of(context).pushNamed("AddData");

        } ,
        tooltip: 'Add',
        backgroundColor: const  Color.fromARGB(255, 150, 0, 72),
        child: const Icon(
          Icons.add,
          color: Colors.white
          ,size: 32.0,),
      ),
      body:
      isLoading ==true?
          const Center(child: Text('Loading',style: TextStyle(fontSize: 16.0,color: Colors.red),),)
      :Center(
             child: ListView(children:  [
            ListView.builder(
                     itemCount: users.length,
                      physics:  const NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemBuilder: (context,i){
                         return Container(

                           padding: const EdgeInsetsDirectional.all(4.0),
                           child: Card(
                               borderOnForeground: true,

                               child: ListTile(
                                 title:Text("${users[i]['Name']}\n${users[i]["Cost"]}"
                                   ,
                                 ) ,
                                 subtitle: Text("${users[i]['Sell']}",style: TextStyle(color: Colors.black),),
                               ),
                              shape:
                              Border.all(color:Color.fromARGB(255, 150, 0, 72)),shadowColor: Color.fromARGB(255, 150, 0, 72),
                               elevation: 32.0
                               ,
                             ),
                         );
                   }),

         ],),
        ),
      );
  }
}
