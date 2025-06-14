import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes of the Day',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const QuotesHomePage(),
    );
  }
}

class QuotesHomePage extends StatefulWidget {
  const QuotesHomePage({super.key});

  @override
  State<QuotesHomePage> createState() => _QuotesHomePageState();
}

class _QuotesHomePageState extends State<QuotesHomePage> {
  // Daftar kutipan inspiratif statis
  final List<Map<String, String>> _quotes = [
    {
      'quote': 'Hidup adalah 10% apa yang terjadi pada Anda dan 90% bagaimana Anda meresponsnya.',
      'author': 'Charles R. Swindoll'
    },
    {
      'quote': 'Masa depan milik mereka yang percaya pada keindahan impian mereka.',
      'author': 'Eleanor Roosevelt'
    },
    {
      'quote': 'Jangan menunggu kesempatan. Ciptakanlah kesempatan itu.',
      'author': 'George Bernard Shaw'
    },
    {
      'quote': 'Keberhasilan adalah kemampuan untuk bergerak dari satu kegagalan ke kegagalan lainnya tanpa kehilangan antusiasme.',
      'author': 'Winston Churchill'
    },
    {
      'quote': 'Cara terbaik untuk memulai adalah berhenti berbicara dan mulai melakukan.',
      'author': 'Walt Disney'
    },
    {
      'quote': 'Inovasi membedakan antara pemimpin dan pengikut.',
      'author': 'Steve Jobs'
    },
    {
      'quote': 'Jika Anda menginginkan sesuatu yang tidak pernah Anda miliki, Anda harus melakukan sesuatu yang tidak pernah Anda lakukan.',
      'author': 'Thomas Jefferson'
    },
    {
      'quote': 'Kebijaksanaan dimulai dengan keajaiban.',
      'author': 'Socrates'
    },
    {
      'quote': 'Kegagalan adalah kesuksesan yang tertunda.',
      'author': 'W. Clement Stone'
    },
    {
      'quote': 'Percayalah pada diri sendiri dan semua yang Anda miliki. Ketahuilah bahwa ada sesuatu di dalam diri Anda yang lebih besar dari hambatan apa pun.',
      'author': 'Christian D. Larson'
    }
  ];

  int _currentQuoteIndex = 0;
  final Random _random = Random();

  // Method untuk mendapatkan kutipan berikutnya secara berurutan
  void _getNextQuote() {
    setState(() {
      _currentQuoteIndex = (_currentQuoteIndex + 1) % _quotes.length;
    });
  }

  // Method untuk mendapatkan kutipan secara acak
  void _getRandomQuote() {
    setState(() {
      int newIndex;
      do {
        newIndex = _random.nextInt(_quotes.length);
      } while (newIndex == _currentQuoteIndex && _quotes.length > 1);
      _currentQuoteIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quotes of the Day',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Card untuk menampilkan kutipan
                Card(
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon quote
                        Icon(
                          Icons.format_quote,
                          size: 48,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 16),
                        // Teks kutipan
                        Text(
                          _quotes[_currentQuoteIndex]['quote']!,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontStyle: FontStyle.italic,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        // Pembuat garis
                        Container(
                          height: 2,
                          width: 100,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 16),
                        // Nama author
                        Text(
                          '- ${_quotes[_currentQuoteIndex]['author']!}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Informasi kutipan ke-
                Text(
                  'Kutipan ${_currentQuoteIndex + 1} dari ${_quotes.length}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 24),
                // Tombol-tombol
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Tombol kutipan berikutnya
                    ElevatedButton.icon(
                      onPressed: _getNextQuote,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Berikutnya'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                    // Tombol kutipan acak
                    ElevatedButton.icon(
                      onPressed: _getRandomQuote,
                      icon: const Icon(Icons.shuffle),
                      label: const Text('Acak'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}