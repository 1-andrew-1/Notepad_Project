import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:untitled2/homepage.dart';
import 'package:untitled2/sizeconfig/sizeconig.dart';
import 'package:untitled2/sql/sql.dart';
import 'package:untitled2/style/appstyle.dart';
import 'package:untitled2/update/updated.dart';

class ISearch extends StatefulWidget  {
  const ISearch({super.key, required this.title, required this.content, required this.data, required this.id});
  final String title ;
  final String content ;
  final String data ;
  final int id ;

  @override
  State<ISearch> createState() => _ISearchState();
}

class _ISearchState extends State<ISearch> {
  Color randomBackgroundColor = Appstyle.cardscolor[Random().nextInt(Appstyle.cardscolor.length)];
  Sql sql = Sql() ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to( () => Updated(id: widget.id, color: Colors.orange ) 
              , transition: Transition.fadeIn
            ) ;
      },
      child: SizedBox(
             height: Sizeconig.defaultsize! * 15.5,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                color: Colors.grey[200],
                child: Stack(
                    children: [
                        Positioned(
                          top: Sizeconig.defaultsize! * 3.5,
                          left: Sizeconig.defaultsize! * 1,
                          child: Text(widget.title.length > 10 ? '${widget.title.substring(0, 10)}...' : widget.title,
                          style: Appstyle.maintittle)
                      ) ,
                      Positioned(
                          top: Sizeconig.defaultsize! * 7,
                          left: Sizeconig.defaultsize! * 1,
                          child: Text(widget.content.length > 14 ? '${widget.content.substring(0, 14)}...' : widget.content,
                            style: Appstyle.maincontent,)
                      ) ,
                      Positioned(
                          bottom: Sizeconig.defaultsize! * 2,
                          right: Sizeconig.defaultsize! * 3,
                          child: Text(widget.data , style: Appstyle.datetittle,)
                      ) ,
                      Positioned(
                          top: Sizeconig.defaultsize! * 2 ,
                          right: Sizeconig.defaultsize! * 8,
                          child: IconButton(onPressed: (){
                            AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: 'Warning',
                            desc: 'are you want to delete this note.............',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () async {
                              int response = await sql.deleteData('''
                                DELETE FROM NOTES WHERE id = ${widget.id}
                            ''') ;
                            if (response > 0) {
                              Get.snackbar('Success', 'Note Delete successfully.');
                              Get.offAll(() => Homepage() , transition: Transition.circularReveal);
                            } else {
                              Get.snackbar('Error', 'Failed to Delete note.');
                            }
                            },
                          ).show();
                          }, icon: Icon(Icons.delete_forever))
                      ) ,
                    ],
                ),
          ),
      ),
    );
  }
}