import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/datashowwing/data0.dart';
import 'package:untitled2/getcontroller/controllor.dart';
import 'package:untitled2/insertdata/insertdata.dart';
import 'package:untitled2/searching/searchpage.dart';
import 'package:untitled2/style/appstyle.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ReadD control = Get.put(ReadD());
  final searchController = Get.put(Searchcontroller());
  @override
  void initState() {
    control.readD();
    super.initState();
    setState(() {});
  }
  List<Map> datasearch = [] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => Insertdata());
        },
        child: const Icon(Icons.note_alt_outlined),
      ),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          )
        ),
        backgroundColor: Colors.orange[200],
        title: Text('  Notes' , style: Appstyle.til),
        actions: [
          IconButton(onPressed: () {
            Get.to(()=> Searchpage( data: datasearch,));
          }, icon: Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GetBuilder<ReadD>(
          builder: (val) => ListView.builder(
            itemCount: val.data.length,
            itemBuilder: (context, index) {
              var dataItem = val.data[index];
              datasearch = val.data ;
              return Datacard0(
                title: dataItem['NOTES_TILTTLES'],
                content: dataItem['NOTES_CONTENT'],
                data: dataItem['data'],
                id: dataItem['ID'],
              );
            },
          ),
        ),
      ),
    );
  }
}
