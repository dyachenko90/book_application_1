import 'package:flutter/material.dart';

class CardBookWidget extends StatelessWidget {
  final int bookId;
  final String title;

  const CardBookWidget({
    super.key,
    required this.bookId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('📖 $title 📖'),
      ),
      body: Stack(
        children: [
          // Прокручиваемая часть
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80), // Отступ под фиксированную панель
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'images/frt.jpg',
                      width: 230,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Є в наявності',
                        style: TextStyle(color: Colors.green),
                      ),
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
                    ],
                  ),
                  Divider(thickness: 0.5),
                  SizedBox(height: 5),
                  buildInfoSection('Автор:', 'Віктор Франкл'),
                  buildInfoSection('Кількість сторінок:', '350'),
                  buildInfoSection('Видавництво:', 'КСД'),
                  buildInfoSection('Рік видання:', '2024'),
                  buildInfoSection('Опис:', 
                    "Уявіть, що на вас чекає побачення вашої мрії, але ви — не надто впевнена в собі людина. Ви знаєте, що ваш партнер або партнерка — вершина всіх ваших мрій, тож маєте бути в найкращій за все своє життя формі. Чи тривожить вас ця ситуація? Якщо ні, закривайте цю книжку й купіть порадник “Як навчитися не брехати”. Якщо так, вітаємо в клубі тривожних пацієнтів. Книжку Володимира Станчишина «Стіни в моїй голові» присвячено тривожності, депресії, соціальним фобіям, різним психічним розладам, які більшою чи меншою мірою впливають на звичний спосіб життя людини в соціумі. Вона не вилікує вас від неприємних станів, але допоможе зрозуміти — жити з ними можливо. Усі ми, стверджує автор, є тривожними, і в цьому немає нічого надзвичайного. Головне — зрозуміти, що тривога супроводжує нас усе життя й відіграє свою важливу роль у нашому існуванні."
                  ),
                  SizedBox(height: 40), // Отступ перед панелью
                ],
              ),
            ),
          ),
          // Закрепленная панель внизу
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Стоимость
                  Text(
                    '150 ₴',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(width: 10),
                  // Кнопка "Купить"
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Купити книгу: $title')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Купити',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Метод для упрощенного создания разделов информации
  Widget buildInfoSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
