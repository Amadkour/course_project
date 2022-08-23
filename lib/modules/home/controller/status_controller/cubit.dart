import 'package:course_project/modules/home/controller/status_controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusCubit extends Cubit<StatusState>{
  StatusCubit():super(StatusLoadedState());

List<String> status=[
  'status 1',
  'status 2',
  'status 3',
  'status 4',
  'status 5',
  'status 6',
  'status 7',
  'status 8',
];


Color statusBackground=Colors.white;


onChangeBackground(){
  if(statusBackground==Colors.green){
    statusBackground=Colors.white;
  }else{
    statusBackground=Colors.green;
  }
  emit(StatusChangedBackgroundState());
}

}