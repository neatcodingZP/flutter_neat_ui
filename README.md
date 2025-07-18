![Tux, the Linux mascot](/doc/impression.jpg "UI matters...")
Photo by <a href="https://unsplash.com/@kellysikkema?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Kelly Sikkema</a> on <a href="https://unsplash.com/photos/a-couple-of-white-and-black-coasters-on-a-brown-surface-QO1-uXSrkAM?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Widgets and utilities for Flutter, to help with UI.
Feel free to use it in your awesome project.

## Table of Contents
- [🚀 Getting started](#🚀-getting-started)
- [🌟 Features](#🌟-features)
    - [🗔 Widgets](#🗔-widgets)
        - [CenterContentScrollView](#➤-centercontentscrollview)
    - [⚙️ Utilities](#⚙️-utilities)
        - [Color](#➤-color)

## 🚀 Getting started

**Step 1: Add dependencies**

```yaml
dependencies:
  neat_ui: <version>
```
And that is all! You're ready to go.

## 🌟 Features

### 🗔 Widgets

#### ➤ CenterContentScrollView
`CustomScrollView` with centered children inside. Centering will apply only if content size is less than ScrollView size.

Usage: 
```dart
final widget = CenterContentScrollView(
    children: [
        Text('Heading'),
        Container(
            width: 100,
            height: 100,
            color: Colors.red,
        ),
    ],
);
```


### ⚙️ Utilities

#### ➤ Color
1. `NeatColorExtension` - extension on `Color`
    - convert color to greyscale;
    - darken/lighten color.

    Usage: 
    ```dart
    final redColor = Colors.red;

    final greyScaleColor = redColor.greyscale();
    ```
