
# Library Manager

A Flutter application for managing a library. The app includes functionalities for viewing, adding, updating, and deleting books and members. Additionally, it features a navigation drawer for easy access to different sections and a search functionality for books.

## Features

- **Home Screen**: Displays a welcome message and an image of the library.
- **Books Management**: View, add, update, delete, and search books.
- **Members Management**: View, add, update, and delete members.
- **About Screen**: Displays information about the app.
- **Navigation Drawer**: Easy access to different sections of the app.

## Project Structure

```
lib/
|-- main.dart
|-- screens/
|   |-- home_screen.dart
|   |-- books_list_screen.dart
|   |-- book_detail_screen.dart
|   |-- add_book_screen.dart
|   |-- update_book_screen.dart
|   |-- members_list_screen.dart
|   |-- member_detail_screen.dart
|   |-- add_member_screen.dart
|   |-- update_member_screen.dart
|   |-- about_screen.dart
|-- widgets/
|   |-- app_drawer.dart
|-- models/
|   |-- book.dart
|   |-- member.dart
```

## Installation



2. **Install dependencies**
   ```sh
   flutter pub get
   ```

3. **Run the app**
   ```sh
   flutter run
   ```

## Usage

### Home Screen

The home screen displays a welcome message and an image of the library. It also provides access to the navigation drawer.

### Books Management

#### Viewing Books

- Navigate to the "Livres" section from the navigation drawer.
- View the list of books along with their details.

#### Adding a Book

- Click on the floating action button (+) to add a new book.
- Fill in the details (Title, Author, Description, Cover URL) and submit.

#### Updating a Book

- Click on the edit icon next to a book in the list.
- Update the details and submit.

#### Deleting a Book

- Click on the delete icon next to a book in the list.

#### Searching Books

- Click on the search icon in the AppBar.
- Type in the search query to filter the list of books.

### Members Management

#### Viewing Members

- Navigate to the "Adhérents" section from the navigation drawer.
- View the list of members along with their details.

#### Adding a Member

- Click on the floating action button (+) to add a new member.
- Fill in the details (Name, Email, Address) and submit.

#### Updating a Member

- Click on the edit icon next to a member in the list.
- Update the details and submit.

#### Deleting a Member

- Click on the delete icon next to a member in the list.

### About Screen

- Navigate to the "À propos" section from the navigation drawer.
- View information about the app.

## Assets

Ensure that the following assets are added to your project:

```
assets/
|-- library.jpg
|-- logo.png

```

Add the assets to your `pubspec.yaml` file:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/library.jpg
    - assets/logo.png
```

## Screenshots

### Home Screen
![Home Screen](assets/home_screen.png)

### Books List Screen
![Books List Screen](assets/books_list_screen.png)

### Book Detail Screen
![Book Detail Screen](assets/book_detail_screen.png)

### Add Book Screen
![Add Book Screen](assets/add_book_screen.png)

### Members List Screen
![Members List Screen](assets/members_list_screen.png)

### Member Detail Screen
![Member Detail Screen](assets/member_detail_screen.png)

### Add Member Screen
![Add Member Screen](assets/add_member_screen.png)

### About Screen
![About Screen](assets/about_screen.png)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
