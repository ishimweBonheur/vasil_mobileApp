import 'package:flutter/material.dart';

const int itemCount = 20;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          // 3-dot menu in app bar
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              _handleMenuSelection(context, value);
            },
            itemBuilder: (BuildContext context) {
              return {'Settings', 'Help', 'About', 'Logout'}.map((
                String choice,
              ) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      // Drawer for navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            // Navigation items
            _buildDrawerItem(
              context,
              icon: Icons.dashboard,
              title: 'Dashboard',
              onTap: () {
                Navigator.pop(context);
                // Navigate to Dashboard
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.person,
              title: 'Profile',
              selected: true,
              onTap: () {
                Navigator.pop(context);
                // Already on Profile page
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.pop(context);
                _navigateToSettings(context);
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.photo_library,
              title: 'Gallery',
              onTap: () {
                Navigator.pop(context);
                _navigateToGallery(context);
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              badgeCount: 3,
              onTap: () {
                Navigator.pop(context);
                _navigateToNotifications(context);
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.favorite,
              title: 'Favorites',
              onTap: () {
                Navigator.pop(context);
                _navigateToFavorites(context);
              },
            ),
            const Divider(),
            _buildDrawerItem(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () {
                Navigator.pop(context);
                _showHelpDialog(context);
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                Navigator.pop(context);
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Profile header
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue.shade50,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Software Developer',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _buildStatItem('Posts', '125'),
                          _buildStatItem('Followers', '1.2k'),
                          _buildStatItem('Following', '350'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Tab bar for different sections
          DefaultTabController(
            length: 4,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.list)),
                    Tab(icon: Icon(Icons.bookmark)),
                    Tab(icon: Icon(Icons.photo)),
                  ],
                ),
                SizedBox(
                  height: 400,
                  child: TabBarView(
                    children: [
                      // Grid View
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.grey[200],
                            child: Center(child: Text('Item ${index + 1}')),
                          );
                        },
                      ),
                      // List View
                      ListView.builder(
                        itemCount: itemCount,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text('List Item ${(index + 1)}'),
                            leading: const Icon(Icons.person),
                            trailing: const Icon(Icons.chevron_right),
                          );
                        },
                      ),
                      // Saved Items
                      ListView.builder(
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text('Saved Item ${(index + 1)}'),
                            leading: const Icon(Icons.bookmark),
                            trailing: const Icon(Icons.more_vert),
                          );
                        },
                      ),
                      // Photos
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                            child: Center(
                              child: Text(
                                'Photo ${index + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    bool selected = false,
    int badgeCount = 0,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: selected,
      selectedTileColor: Colors.blue.shade50,
      trailing: badgeCount > 0
          ? Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badgeCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : null,
      onTap: onTap,
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'Settings':
        _navigateToSettings(context);
        break;
      case 'Help':
        _showHelpDialog(context);
        break;
      case 'About':
        _showAboutDialog(context);
        break;
      case 'Logout':
        _showLogoutDialog(context);
        break;
    }
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Settings')),
          body: const Center(child: Text('Settings Page')),
        ),
      ),
    );
  }

  void _navigateToGallery(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Gallery')),
          body: const Center(child: Text('Gallery Page')),
        ),
      ),
    );
  }

  void _navigateToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Notifications')),
          body: const Center(child: Text('Notifications Page')),
        ),
      ),
    );
  }

  void _navigateToFavorites(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Favorites')),
          body: const Center(child: Text('Favorites Page')),
        ),
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Help & Support'),
        content: const Text('Contact support@example.com for assistance.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About'),
        content: const Text('Profile App v1.0.0\n© 2024 Your Company'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Perform logout
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
