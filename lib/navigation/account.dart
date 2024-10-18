import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft, // Aligns title to the left
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Arup Kumar Das',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[900],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min, // Takes only necessary space
                  children: [
                    Icon(Icons.star, size: 20),
                    SizedBox(width: 5), // Spacing between the icon and text
                    Text(
                      '4.58',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: const [
          CircleAvatar(
            radius: 25, // Adjusted radius for better fit
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton(Icons.help, 'Help'),
                  _buildIconButton(Icons.payment, 'Payment'),
                  _buildIconButton(Icons.list_alt, 'Activity'),
                ],
              ),
              const SizedBox(height: 20),
              _buildCardWithIcon(
                icon: Icons.percent,
                title: 'You have multiple promos',
                subtitle:
                    'We\'ll automatically apply the one that saves you the most.',
              ),
              const SizedBox(height: 10),
              _buildCardWithProgress(
                title: 'Safety checkup',
                subtitle: 'Learn ways to make rides safer',
                progress: 2,
                total: 5,
              ),
              const SizedBox(height: 10),
              _buildCardWithIcon(
                icon: Icons.privacy_tip,
                title: 'Privacy checkup',
                subtitle: 'Take an interactive tour of your privacy settings',
              ),
              const Divider(
                  thickness: 0.5, color: Colors.grey), // Divider color added
              Column(
                children: [
                  customListTile(title: 'Settings', iconName: Icons.settings),
                  customListTile(title: 'Messages', iconName: Icons.message),
                  customListTile(
                      title: 'Send a gift', iconName: Icons.card_giftcard),
                  customListTile(
                      title: 'Earn by driving or delivering',
                      iconName: Icons.person),
                  customListTile(
                      title: 'Setup your business profile',
                      iconName: Icons.work),
                  customListTile(
                      title: 'Manage Uber account', iconName: Icons.person),
                  customListTile(title: 'Legal', iconName: Icons.info),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'v4.544.2372u',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customListTile({
    String title = '', // Optional title with a default value
    String subtitle = '', // Optional subtitle with a default value
    IconData iconName = Icons.info, // Optional icon with a default value
  }) {
    return ListTile(
      leading: Icon(
        iconName,
        color: Colors.white,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: subtitle
              .isNotEmpty // Check if subtitle is not empty before displaying
          ? Text(subtitle, style: const TextStyle(color: Colors.white))
          : null, // Display null if subtitle is empty
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: () {},
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCardWithIcon({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          trailing: Icon(icon, color: Colors.purpleAccent),
          title: Text(title, style: const TextStyle(color: Colors.white)),
          subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }

  Widget _buildCardWithProgress({
    required String title,
    required String subtitle,
    required int progress,
    required int total,
  }) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          trailing: CircularProgressIndicator(
            value: progress / total,
            backgroundColor: Colors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          title: Text(title, style: const TextStyle(color: Colors.white)),
          subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
