import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_trending/src/blocs/githubtrending/github_trending_bloc.dart';
import 'package:models/models.dart';

import 'github_trending_list_item.dart';

class GithubTrendingList extends StatelessWidget {
  const GithubTrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.black,
      onRefresh: () async {
        Future block =
        context.read<GithubTrendingBloc>().stream.firstWhere((element) => element is GithubTrendingStateSuccess || element is GithubTrendingStateError);

        context.read<GithubTrendingBloc>().add(const GithubTrendingEvent.githubTrendingRefreshed());

        await block;
      },
      child: Stack(
        children: [
          StreamBuilder(
            stream: context.read<GithubTrendingBloc>().dataStream,
            builder: (BuildContext context, AsyncSnapshot<List<GithubRepo>> snapshot) {
              List<GithubRepo>? streamData = snapshot.data;

              if (streamData == null) {
                return Container();
              }

              return ListView.builder(
                itemCount: streamData.length,
                itemBuilder: (BuildContext context, int index) {
                  return GithubTrendingListItem(
                    key: Key("HomepageListItem-${streamData[index].id}"),
                    onTap: () {
                      context.read<GithubTrendingBloc>().add(GithubTrendingEvent.githubTrendingItemClicked(streamData[index]));
                    },
                    data: streamData[index],
                  );
                },
              );
            },
          ),
          BlocBuilder<GithubTrendingBloc, GithubTrendingState>(
            builder: (context, state) {
              switch (state) {
                case GithubTrendingStateInitial():
                  return Container(
                    color: Colors.black,
                  );
                case GithubTrendingStateLoading():
                  return Container(
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  );
                case GithubTrendingStateError(message: final message):
                  {
                    final snackBar = SnackBar(
                      content: Text(message),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });

                    return Container();
                  }
                case GithubTrendingStateSuccess():
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}