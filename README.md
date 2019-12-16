# Github Search

Sample project which illustrates how to setup a Flutter and AngularDart project with code sharing.

## Quick Start

_Make sure you have the [Dart SDK](https://www.dartlang.org/tools/sdk) and [Flutter SDK](https://flutter.io/docs/get-started/install) installed before proceeding._

Open this project in your editor of choice (VSCode is recommended).

### Setup

1. Install dependencies for `common_github_search`:

   ```bash
   # change directories into core
   cd core

   # install dependencies
   pub get

   # change directories back out to the root directory
   cd ../
   ```

2. Install dependencies for `flutter_bloc_example`

   ```bash
   # change directories into flutter_bloc_example
   cd flutter_bloc_example

   # install dependencies
   flutter packages get

   # change directories back out to the root directory
   cd ../
   ```

3. Install dependencies for `angular_bloc_example`

   ```bash
   # change directories into flutter_bloc_example
   cd angular_bloc_example

   # install dependencies
   pub get

   # change directories into flutter_bloc_example
   cd ../
   ```

### Run Flutter

```bash
# change directories into flutter_bloc_example
cd flutter_bloc_example

# run the flutter project
flutter run
```

### Run AngularDart

```bash

# change directories into angular_bloc_example
cd angular_bloc_example

# run the angular project
webdev serve
```
