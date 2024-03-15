import 'package:flutter/material.dart';
import 'package:models/models.dart';

class GithubTrendingListItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final GithubRepo data;

  const GithubTrendingListItem({
    super.key,
    required this.onTap,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: InkWell(
            onTap: onTap,
            highlightColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        data.avatarUrl,
                        width: 40,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.owner,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              data.name,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            data.isExpanded
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.description,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color: Colors.black,
                                            size: 10,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            data.language,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[700],
                                            size: 10,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            data.stargazerCount,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          const Icon(
                                            Icons.accessibility,
                                            color: Colors.black,
                                            size: 10,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            data.forksCount,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          height: 0,
        )
      ],
    );
  }
}
