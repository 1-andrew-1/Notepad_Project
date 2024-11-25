import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/datashowwing/searchshow.dart';
import 'package:untitled2/getcontroller/controllor.dart';
import 'package:untitled2/style/appstyle.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key, required this.data});
  final List<Map> data;
  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final sear = Get.put(Searchcontroller());
  @override
  void initState() {
    sear.data = widget.data.obs ;
    super.initState();
  }
  @override
  void dispose() {
    sear.searchQuery = ''.obs;
    sear.data = <Map>[].obs;
    sear.filterdata = <Map>[].obs;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (val)  {
            sear.setValue(val);
            sear.fetchData();
          },
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Obx(() => sear.searchQuery.isEmpty
          ? Center(child:Text('No recent searches' ,style: 
                Appstyle.no_found 
              ,) ,)
          : sear.filterdata.isEmpty ? 
              Center(child:Text('No data found' ,style: 
                Appstyle.no_found 
              ,) ,) : 
              Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListView.builder(
                itemCount: sear.filterdata.length,
                itemBuilder: (context, index) {
                  var dataItem = sear.filterdata[index];
                  return ISearch(
                    title: dataItem['NOTES_TILTTLES'],
                    content: dataItem['NOTES_CONTENT'],
                    data: dataItem['data'],
                    id: dataItem['ID'],
                  );
                },
              ),
            ) ),
    );
  }
}
