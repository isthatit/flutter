import 'package:flutter/material.dart';
import 'package:flutter_book_list/detail_screen.dart';

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
            description:
                '1머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '11손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습1',
          ),
          BookTile(
            description:
                '2머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '22손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습2',
          ),
          BookTile(
            description:
                '3머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '33손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습3',
          ),
          BookTile(
            description:
                '4머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '44손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습4',
          ),
          BookTile(
            description:
                '5머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지...',
            image:
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FluBzz%2FbtrDgN9C4uV%2FiW0PWcSwI4qAfYonoymFkk%2Fimg.png',
            subtitle: '55손으로 풀어보는 Q-Learning',
            title: '패키지 없이 R로 구현하는 심층 강화학습5',
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
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              subtitle: subtitle,
              description: description,
              image: image,
            ),
          ),
        );
      }, // 여기서 title, subtitle, description, image 다에티러르 다음 화면으로 이동하며 넘기게 됨);
    );
  }
}
