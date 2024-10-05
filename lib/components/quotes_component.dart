// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../services/quotes/quotes_model.dart';
import '../services/quotes/quotes_service.dart';

class QuotesComponent extends StatefulWidget {
  const QuotesComponent({super.key});

  @override
  _QuotesComponentState createState() => _QuotesComponentState();
}

class _QuotesComponentState extends State<QuotesComponent> {
  late Future<QuoteModel> futureQuote;
  final QuoteService quoteService = QuoteService();

  @override
  void initState() {
    super.initState();
    futureQuote = _fetchQuoteOncePerDay();
  }

  Future<QuoteModel> _fetchQuoteOncePerDay() async {
    return await quoteService.fetchQuoteOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.format_quote,
                      color: Colors.yellowAccent, size: 30),
                  SizedBox(width: 8),
                  Text(
                    'Quote of the Day',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            FutureBuilder<QuoteModel>(
              future: futureQuote,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "'' ${snapshot.data!.quote} ''",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '- ${snapshot.data!.author}',
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text(
                    'No quote available',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
