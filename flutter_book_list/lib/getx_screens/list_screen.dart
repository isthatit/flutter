import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'package:flutter_book_list/models/book.dart';
import 'package:flutter_book_list/repositories/book_repository.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  final List<Book> books = BookRepository().getBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('도서 목록 앱'),
        ),
        body: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookTile(book: books[index]);
            }));
  }
}

class BookTile extends StatelessWidget {
  final Book book;
  BookTile({required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      leading: Image.network(book.image),
      onTap: () {
        // 이렇게 길고 복잡한 코드가
        /*
        Navigator.of(context).push(MaterialPageRoute(builder: 
          (context) => DetailScreen(book: book))
        );
        */

        // 이렇게 편하게 바뀜.
        Get.to(DetailScreen(book: book));
      },
    );
  }
}
