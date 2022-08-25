import 'package:course_project/modules/home/controller/post_controller/post_states.dart';
import 'package:course_project/modules/home/provider/database/post_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState>{
  PostCubit():super(PostClosedState()){
    readPosts();
  }

  TextEditingController postTextController=TextEditingController();

  ///-----------database class
  PostDB db=PostDB();

  ///----------------posts list------------///
  List<String> posts=[];
  double postPadding=10;

  void changePostPadding(){

    if(postPadding==10){
      postPadding=50;
      emit(PostOpenedState());
    }else{
      postPadding=10;
      emit(PostClosedState());
    }

  }

  insertPost(){
    ///----------------insert----------------///
    db.insertPost(postTextController.text);
    postTextController.text='';
    emit(PostIncreasedState());
    ///-----------------reload---------------///
    readPosts();
  }

  readPosts() async {
   posts= (await db.readPosts()).map((e) =>e['name'].toString()).toList();
   emit(PostLoadedState());

  }

}