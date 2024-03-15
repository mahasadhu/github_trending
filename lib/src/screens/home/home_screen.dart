import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_trending/src/blocs/githubtrending/github_trending_bloc.dart';
import 'package:github_trending/src/screens/home/widgets/github_trending_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Trending",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        actions: [
          BlocBuilder<GithubTrendingBloc, GithubTrendingState>(
            builder: (context, state) {
              return PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    {"id": "1", "text": "Sort by stars"},
                    {"id": "2", "text": "Sort by name"},
                  ]
                      .map(
                        (choice) => PopupMenuItem<Map<String, String>>(
                      value: choice,
                      child: Text(choice["text"] ?? ""),
                    ),
                  )
                      .toList();
                },
                onSelected: (Map<String, String> selected) {
                  switch (selected["id"]) {
                    case "1":
                      {
                        context.read<GithubTrendingBloc>().add(const GithubTrendingEvent.githubTrendingSortByStarsClicked());
                      }
                    case "2":
                      {
                        context.read<GithubTrendingBloc>().add(const GithubTrendingEvent.githubTrendingSortByNameClicked());
                      }
                  }
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              );
            },
          ),
        ],
      ),
      body: const GithubTrendingList(),
    );
  }
}
