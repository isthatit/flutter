import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도서 목록 앱'),
      ),
      body: ListView(
        children: [
          BookTile(
            description: '머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습',
          ),
          BookTile(
            description: '머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습',
          ),
          BookTile(
            description: '머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습',
          ),
          BookTile(
            description: '머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습',
          ),
          BookTile(
            description: '머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습',
          ),
        ],
      ),
    );
  }
}

class BookTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  BookTile({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Image.network(image),
      onTap:
          () {}, // 여기서 title, subtitle, description, image 다에티러르 다음 화면으로 이동하며 넘기게 됨);
    );
  }
}
