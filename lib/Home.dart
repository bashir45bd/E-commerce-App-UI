import 'package:flutter/material.dart';
import 'Product.dart';

class Main extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Main> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.cyan,
        selectedItemColor: Color(0xFF201F1F),
        unselectedItemColor: Color(0xFFDC1E76),
        showUnselectedLabels: true,
        iconSize: 30,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Name'),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFDC1E76),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ExpansionTile(
                title: Text("Categories", style: TextStyle(fontSize: 20)),
                children: <Widget>[
                  ListTile(title: Text("Electronics")),
                  ListTile(title: Text("Clothing")),
                  ListTile(title: Text("Home & Garden")),
                  ListTile(title: Text("Sports & Outdoors")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ResponsiveGridView(),
            ),
          ],
        ),
      ),
    );
  }
}




class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: Color(0xFFDC1E76),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 5, // Example: 5 cart items
        itemBuilder: (context, index) {
          return CartItem();
        },
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1; // Initial quantity

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600; // Adjusts for mobile vs tablet

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.04,
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('icon/insta.png', // Replace with product image
                width: isSmallScreen ? screenWidth * 0.22 : screenWidth * 0.15,
                height: isSmallScreen ? screenWidth * 0.22 : screenWidth * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Title",
                    style: TextStyle(
                      fontSize: isSmallScreen ? screenWidth * 0.045 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    "\$99.99",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: isSmallScreen ? screenWidth * 0.04 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    children: [
                      Text(
                        "Qty:",
                        style: TextStyle(
                          fontSize: isSmallScreen ? screenWidth * 0.04 : 16,
                        ),
                      ),
                      SizedBox(width: 5),
                      QuantitySelector(
                        quantity: quantity,
                        onIncrease: increaseQuantity,
                        onDecrease: decreaseQuantity,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          // Remove item from cart
                        },
                        child: Text(
                          "Remove",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: isSmallScreen ? screenWidth * 0.04 : 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  QuantitySelector({
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove, color: Colors.red),
          onPressed: onDecrease,
        ),
        Text(
          '$quantity',
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.add, color: Colors.green),
          onPressed: onIncrease,
        ),
      ],
    );
  }
}



class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: Color(0xFFDC1E76),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 5, // Example count
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.network(
                'https://img.drz.lazcdn.com/static/bd/p/0e7afb28fda02c3b24c39eb41d11fc4d.jpg_200x200q80.jpg_.webp',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text("Product Title"),
              subtitle: Text("\$99.99"),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Remove from favorites functionality
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header with Cover Image
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color(0xFFDC1E76),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://www.w3schools.com/w3images/avatar2.png'), // User profile image
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              "User Name",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "user@example.com",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Profile Options List
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ProfileOption(
                    icon: Icons.person,
                    title: "Edit Profile",
                    onTap: () {},
                  ),
                  ProfileOption(
                    icon: Icons.lock,
                    title: "Change Password",
                    onTap: () {},
                  ),
                  ProfileOption(
                    icon: Icons.shopping_cart,
                    title: "My Orders",
                    onTap: () {},
                  ),
                  ProfileOption(
                    icon: Icons.favorite,
                    title: "My Wishlist",
                    onTap: () {},
                  ),
                  ProfileOption(
                    icon: Icons.settings,
                    title: "Settings",
                    onTap: () {},
                  ),
                  ProfileOption(
                    icon: Icons.logout,
                    title: "Logout",
                    iconColor: Colors.red,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Profile Option Widget
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;
  final VoidCallback onTap;

  ProfileOption({required this.icon, required this.title, this.iconColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Colors.black),
        title: Text(title, style: TextStyle(fontSize: 16)),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}



class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth ~/ 200).clamp(2, 4); // Responsive columns

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, // Dynamic column count
        childAspectRatio: 0.6, // Adjusted aspect ratio
      ),
      itemCount: 10, // Replace with actual product count
      itemBuilder: (context, index) {
        return ProductItem(imageUrl: 'https://img.drz.lazcdn.com/static/bd/p/88ce76e49e27454891d96bb6983b40e2.jpg_400x400q80.jpg', title: 'Product Title', price: 99.99, rating: 4.5, reviews: 120, onTap: () {  }, onFavoriteToggle: () {  },);
      },
    );
  }
}

class ProductItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final int reviews;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorite ? "Added to favorites" : "Removed from favorites"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${widget.title} clicked"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        _showSnackBar();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductDetailsPage()),
        );
      },// Click action to show snackbar
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400, // Adjust for responsiveness
            ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5), // Adds 5px margin from the top
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.25, // Responsive height
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: _toggleFavorite,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "\$${widget.price}",
                          style: TextStyle(
                            color: Color(0xFFDC1E76),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            Text(
                              ' ${widget.rating} ',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '(${widget.reviews} reviews)',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )



    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "U",
                style: TextStyle(fontSize: 40.0, color: Colors.black),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navigate to home
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () {
              // Navigate to cart
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () {
              // Navigate to favorites
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Navigate to profile
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to settings
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
