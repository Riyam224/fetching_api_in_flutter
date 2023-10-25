import 'package:api_app/data/models/post_model.dart';
import 'package:api_app/logic/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api showing '),
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const  Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostSuccess) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  PostModel post = state.posts[index];
                  return ListTile(
                    title: Text(post.title.toString()),
                  );
                },
              );
            }
            return  const Center(
              child: Text('An error occured'),
            );
          },
        ),
      ),
    );
  }
}

