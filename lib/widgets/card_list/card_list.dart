import 'package:flutter/material.dart';

class Book {
  final int bookId;
  final String title;
  final String author;
  final String imageName;
  final String price;

  Book(
      {required this.bookId,
      required this.title,
      required this.author,
      required this.imageName,
      required this.price});
}

class CardListWidget extends StatefulWidget {
  const CardListWidget({super.key});

  @override
  State<CardListWidget> createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  final TextEditingController _searchController = TextEditingController();
  late List<Book> _filteredBooks;

  final _books = <Book>[
    Book(
        bookId: 1,
        title: 'Людина в пошуках справжнього сенсу',
        author: 'Віктор Франкл',
        imageName: 'images/frt.jpg',
        price: '120'),
    Book(
        bookId: 2,
        title: 'Підсвідомості все підвладне',
        author: 'Джон Кехо',
        imageName: 'images/frt.jpg',
        price: '170'),
    Book(
        bookId: 3,
        title: 'Мистецтво говорити',
        author: 'Джемс Борг',
        imageName: 'images/frt.jpg',
        price: '250'),
    Book(
        bookId: 4,
        title: 'Шлях до фінансової свободи',
        author: 'Бодо Шефер',
        imageName: 'images/frt.jpg',
        price: '315'),
    Book(
        bookId: 5,
        title: 'Мистецтво війни',
        author: 'Сунь-цзи',
        imageName: 'images/frt.jpg',
        price: '520'),
    Book(
        bookId: 6,
        title: '1984',
        author: 'Джордж Орвелл',
        imageName: 'images/frt.jpg',
        price: '90'),
    Book(
        bookId: 7,
        title: 'Танці з кістками',
        author: 'Андрій Сем’янків',
        imageName: 'images/frt.jpg',
        price: '220'),
  ];

  void _filterBooks() {
    setState(() {
      if (_searchController.text.isNotEmpty) {
        _filteredBooks = _books
            .where((book) => book.title
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      } else {
        _filteredBooks = List.from(_books);
      }
    });
  }

  void _tapCard(int index) {
    final book = _filteredBooks[index];
    Navigator.of(context).pushNamed(
      '/main_screen/card_book',
      arguments: {'id': book.bookId, 'title': book.title},
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredBooks = List.from(_books);
    _searchController.addListener(_filterBooks);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _filteredBooks.isEmpty
              ? Center(
                  child: Text(
                    'За Вашим запитом нічого не знайдено',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding:
                      EdgeInsets.only(top: 70), 
                  itemCount: _filteredBooks.length,
                  itemBuilder: (context, index) {
                    final book = _filteredBooks[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(15.0),
                        elevation: 4,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            _tapCard(index);
                          },
                          borderRadius: BorderRadius.circular(15.0),
                          splashColor: Colors.orange.withOpacity(0.3),
                          highlightColor: Colors.orange.withOpacity(0.1),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                ),
                                child: Image(
                                  image: AssetImage(book.imageName),
                                  width: 120.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        book.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        book.author,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${book.price} ₴',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.shopping_cart),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8), 
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Пошук книги...',
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
