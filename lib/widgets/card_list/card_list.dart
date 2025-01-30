import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.hardEdge,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: Material( // ✅ Обернули в Material, чтобы InkWell работал корректно
            borderRadius: BorderRadius.circular(15.0),
            elevation: 4,
            color: Colors.white,
            child: InkWell(
              onTap: () { 
                print("Карточка $index нажата");
              },
              borderRadius: BorderRadius.circular(15.0), 
              splashColor: Colors.orange.withOpacity(0.3),
              highlightColor: Colors.orange.withOpacity(0.1),
              child: Row(
                children: [
                  // Фото с закругленными левыми углами
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                    child: const Image(
                      image: AssetImage('images/frt.jpg'),
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Людина в пошуках сенсу',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Віктор Франкл',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '120 ₴',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.shopping_cart),
                                onPressed: () {
                                  print("Добавлено в корзину");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
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
    );
  }
}
