import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _subscriptionStatus;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSubscriptionStatus();
  }

  Future<void> _fetchSubscriptionStatus() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.user.uid)
          .get();

      if (userDoc.exists && userDoc.data()!.containsKey('subscription')) {
        setState(() {
          _subscriptionStatus = userDoc.data()!['subscription'];
        });
      } else {
        setState(() {
          _subscriptionStatus = 'Brak subskrypcji';
        });
      }
    } catch (e) {
      setState(() {
        _subscriptionStatus = 'Błąd pobierania danych';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    // Po wylogowaniu AuthGate automatycznie przeniesie do ekranu logowania,
    // więc musimy się upewnić, że wrócimy do ekranu głównego.
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Użytkownika'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: widget.user.photoURL != null
                    ? NetworkImage(widget.user.photoURL!)
                    : null,
                child: widget.user.photoURL == null
                    ? const Icon(Icons.person, size: 60)
                    : null,
              ),
              const SizedBox(height: 20),
              Text(
                widget.user.displayName ?? 'Brak nazwy użytkownika',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.user.email ?? 'Brak adresu e-mail',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),
              _buildInfoRow('Subskrypcja', _isLoading ? 'Ładowanie...' : _subscriptionStatus ?? 'Brak danych'),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: signUserOut,
                icon: const Icon(Icons.logout),
                label: const Text('Wyloguj się'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
