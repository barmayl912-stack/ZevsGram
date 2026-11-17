import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  static const tabs = [
    (Icons.chat_bubble_outline_rounded, 'Чаты'),
    (Icons.card_giftcard_rounded, 'Подарки'),
    (Icons.storefront_outlined, 'Маркет'),
    (Icons.person_outline_rounded, 'Профиль'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF080A0F),
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                gradient: const LinearGradient(
                  colors: [Color(0xFFB9DDF7), Color(0xFF3C9DEB), Color(0xFF14283B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  BoxShadow(color: Color(0x553C9DEB), blurRadius: 18),
                ],
              ),
              child: const Icon(Icons.bolt_rounded, color: Colors.black, size: 23),
            ),
            const SizedBox(width: 11),
            const Text(
              'ZevsGram',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: .2),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded, color: Color(0xFF9BD7FF)),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit_square, color: Color(0xFF9BD7FF)),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: selectedTab,
        children: const [
          _ChatsView(),
          _PlaceholderView(icon: Icons.card_giftcard_rounded, title: 'NFT-подарки', subtitle: 'Коллекционные подарки и редкость'),
          _PlaceholderView(icon: Icons.storefront_rounded, title: 'Маркетплейс', subtitle: 'Коллекции TON появятся здесь'),
          _PlaceholderView(icon: Icons.account_circle_outlined, title: 'Профиль ZevsGram', subtitle: 'Аватар, оформление и подключение TON-кошелька'),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF0D121B),
        indicatorColor: const Color(0x333C9DEB),
        selectedIndex: selectedTab,
        onDestinationSelected: (value) => setState(() => selectedTab = value),
        destinations: [
          for (final tab in tabs)
            NavigationDestination(icon: Icon(tab.$1), label: tab.$2),
        ],
      ),
    );
  }
}

class _ChatsView extends StatelessWidget {
  const _ChatsView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0x443C9DEB)),
            gradient: const LinearGradient(
              colors: [Color(0xFF142234), Color(0xFF10151F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Row(
            children: [
              Icon(Icons.shield_moon_outlined, color: Color(0xFF80C9FF), size: 27),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Твоя приватность — приоритет', style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(height: 3),
                    Text('Защищённые чаты будут доступны после подключения сервера',
                      style: TextStyle(color: Color(0xFF9BA9B9), fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text('СООБЩЕНИЯ', style: TextStyle(color: Color(0xFF7F91A5), fontSize: 11, letterSpacing: 1.6, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        const _EmptyState(),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 34),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
    decoration: BoxDecoration(
      color: const Color(0xFF10151E),
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: const Color(0x221A9BEF)),
    ),
    child: const Column(
      children: [
        Icon(Icons.forum_outlined, size: 42, color: Color(0xFF55B9FF)),
        SizedBox(height: 14),
        Text('Пока нет чатов', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        SizedBox(height: 7),
        Text('Создай аккаунт ZevsGram и начни общаться.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF9BA9B9), height: 1.45)),
      ],
    ),
  );
}

class _PlaceholderView extends StatelessWidget {
  const _PlaceholderView({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF55B9FF), size: 54),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(subtitle, textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF9BA9B9))),
          const SizedBox(height: 18),
          const Text('Раздел в разработке', style: TextStyle(color: Color(0xFF55B9FF), fontSize: 12)),
        ],
      ),
    ),
  );
}
