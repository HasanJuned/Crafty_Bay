# About crafty_bay

Greetings from Hasan. I have done this E-commerce project named ‘Crafty Bay’.
The following documentation is about my project, here I have included my goals, features and
architecture. 

# APK file 
Link: [APK](https://drive.google.com/file/d/1HAZjpmwKCssXxOJjidWX7Ho0qvHPbLJo/view?usp=sharing)

# Documentation 
Link: [PDF](https://drive.google.com/file/d/1QezFknLlKexvSLONr4tKjZ0lFWFKyyy3/view?usp=sharing)

# Video link
Link: [video](https://drive.google.com/file/d/1duUO0mTRpOabhhutBr5tAYfRDYH16lQu/view?usp=sharing)

# Goals:
By using this ‘Crafty Bay’ app, users can view products that are available, and add to their cart
and wish list, users also can checkout and choose their preferred payment gateway to confirm the
products. Only registered users can add the products to the cart and wishlist and order the
product. Others can only view the available products.

# Interesting features:
● Checking internet connection
● Light / dark mode
● Payment gateway
● Calling customer support via directly opening the phone number pad
● Check whether the user is registered or not for before placing order

# I have used the following tools in this project:
● Flutter
● GetX
● API

# I have tried to follow MVVM architecture.
└── lib/
├── application/
│ ├── app.dart
│ └── state_holder_binders.dart
├── data/
│ ├── models/
│ │ └── model files are here
│ ├── services/
│ │ └── network_caller.dart
│ └── utility/
│ └── urls.dart
├── presentation/
│ ├── state_holders/
│ │ └── controller files are here
│ └── ui/
│ ├── screens/
│ │ ├── auth/
│ │ │ └── auth related screen files are here
│ │ └── other screens files are here
│ ├── utility
│ └── widgets/
│ ├── home widgets/
│ │ └── home screen related widgets files are here
│ └── other screen widgets files are here
└── main.dart

