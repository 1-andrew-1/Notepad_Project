import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:untitled2/sizeconfig/sizeconig.dart';
import 'package:untitled2/sql/sql.dart';
import 'package:untitled2/style/appstyle.dart';
import 'package:untitled2/update/updated.dart';
import 'package:untitled2/widget/SmoothDeleteButton.dart';

class Datacard0 extends StatefulWidget  {
  const Datacard0({super.key, required this.title, required this.content, required this.data, required this.id});
  final String title ;
  final String content ;
  final String data ;
  final int id ;

  @override
  State<Datacard0> createState() => _Datacard0State();
}

class _Datacard0State extends State<Datacard0> {
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
                color: Colors.orange[50] ,
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
                      SmoothDeleteButton(
                        id: widget.id,
                        deleteNoteCallback: (id) async {
                          return await sql.deleteData('DELETE FROM NOTES WHERE id = $id');
                        },
                      ),
                    ],
                ),
          ),
      ),
    );
  }
}
