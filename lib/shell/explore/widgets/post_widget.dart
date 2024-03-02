import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final List<Map<String, String>> postItems = [
    {
      "pseudo": 'Karan and Bhavy Trust',
      "photo": "assets/images/donate.jpg",
      "photoProfile": "assets/images/ngo3.jpg",
      "description": "Share a Meal, Share a Love",
    },
    {
      "pseudo": 'Ashirwad Seva Charitable Trust',
      "photo": "assets/images/donate.jpg",
      "photoProfile": "assets/images/ngo.jpg",
      "description":
          "Ashirwad Seva Charitable organization dedicated to working for Poor and Needy people.",
    },
    {
      "pseudo": 'Pareewartann Charitable Trust',
      "photo": "assets/images/donate.jpg",
      "photoProfile": "assets/images/ngo2.jpg",
      "description":
          "Pareewartann Charitable Trust is dedicated to working for Health, Water.",
    },
    {
      "pseudo": 'Shree Bolbala Trust',
      "photo": "assets/images/donate.jpg",
      "photoProfile": "assets/images/ngo3.jpg",
      "description":
          "Shree Bolbala organization is dedicated to working on the Health and Care of Disables, Orphans, and Handicapped.",
    },
    {
      "pseudo": 'PRAYAS',
      "photo": "assets/images/donate.jpg",
      "photoProfile": "assets/images/ngo4.jpg",
      "description":
          "PRAYAS organization dedicated to working for the Development of Mentally Challenged Children.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: postItems.map((post) => PostItem(post: post)).toList(),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.post}) : super(key: key);

  final Map<String, String> post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(post['photoProfile']!),
              ),
              const SizedBox(width: 10),
              Text(
                post['pseudo']!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const SizedBox(width: 5),
              const Spacer(), // Use Spacer instead of Expanded
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(post['photo']!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    post['pseudo']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      post['description']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '4 min ago - ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
