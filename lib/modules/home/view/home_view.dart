import 'package:course_project/modules/home/controller/post_controller/post_cubit.dart';
import 'package:course_project/modules/home/controller/post_controller/post_states.dart';
import 'package:course_project/modules/home/controller/status_controller/cubit.dart';
import 'package:course_project/modules/home/controller/status_controller/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home Sceen'),
      ),
      body: Column(
        children: [
          ///-------------------status
          BlocProvider(
            create: (context) => StatusCubit(),
            child: BlocBuilder<StatusCubit, StatusState>(
              builder: (context, state) {
                StatusCubit controller = context.read<StatusCubit>();
                return SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: controller.status
                        .map(
                          (e) => InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.statusBackground,
                                  border:
                                      Border.all(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                  child: Text(
                                e,
                                style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            onTap: () {
                              controller.onChangeBackground();
                            },
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ),

          ///------------------posts
          BlocProvider(
            create: (context) => PostCubit(),
            child: BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                PostCubit controller = context.read<PostCubit>();
                return Flexible(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: TextField(
                              controller: controller.postTextController,
                            ),
                          ),
                          TextButton(onPressed: controller.insertPost, child: const Text('ADD'))
                        ],
                      ),
                      ...controller.posts
                          .map(
                            (e) => InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(controller.postPadding),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(e),
                          ),
                          onTap: () {
                            controller.changePostPadding();
                          },
                        ),
                      )
                          .toList(),


                    ],
                  ),
                );
              },
            ),
          ),
          ///----------------new Post


        ],
      ),
    );
  }
}
