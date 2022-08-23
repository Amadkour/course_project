import 'package:course_project/modules/home/controller/post_controller/post_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState>{
  PostCubit():super(PostClosedState());



  ///----------------posts list------------///
  List<String> posts=[
    'post 1 from Flutter Course',
    'post 2 from Flutter Course',
    'post 3 from Flutter Course',
    'post 4 from Flutter Course',
    'post 5 from Flutter Course',
    'post 6 from Flutter Course',
    'post 7 from Flutter Course',
    'post 8 from Flutter Course',
    'post 9 from Flutter Course',
    'post 10 from Flutter Course',
  ];
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

}