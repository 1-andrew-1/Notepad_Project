import 'package:get/get.dart';
import 'package:untitled2/sql/sql.dart';

class Searchcontroller extends GetxController {
    RxBool isSearching = false.obs ; 
    //RxString searchQuery = ''.obs;
    //ReadD readD = Get.find();
    void search() {
      isSearching.value = ! isSearching.value ;
    }
    RxString searchQuery ="".obs;
    void setValue(String value) {
      searchQuery.value = value;
    }
    RxList <Map> data = <Map>[].obs;
    RxList <Map> filterdata = <Map>[].obs;
    void fetchData() {
      filterdata.value = data.where((item) => item['NOTES_TILTTLES'].toString()
      .toLowerCase().contains(searchQuery.value.toLowerCase())).toList();
      
    }
}
class ReadD extends GetxController {
    Sql sql = Sql();
    List<Map> data =[] ;
    readD() async {
      List<Map> response = await sql.readData("SELECT * FROM NOTES");
        data = response; // Update the data in the state
        update(); // Trigger a state update
    }
}
