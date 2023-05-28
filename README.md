<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/joneldominic/personal-finance-management-app">
    <img src="images/logo.png" alt="Logo" height="200">
  </a>

<h2 align="center">Finance Buddy</h2>

  <p align="center">
    An open source budget / expense tracker app.
    <br />
    <br />
    <a href="https://github.com/joneldominic/personal-finance-management-app">View Demo</a> <!-- TODO: Create Demo and link it here -->
    ·
    <a href="https://github.com/joneldominic/personal-finance-management-app/issues">Report Bug</a>
    ·
    <a href="https://github.com/joneldominic/personal-finance-management-app/issues">Request Feature</a>
    <br />
    <br />
  </p>
</div>

<p align="center">
    <a href="https://github.com/joneldominic/personal-finance-management-app/graphs/commit-activity" alt="Maintained">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a href="https://github.com/joneldominic/personal-finance-management-app/blob/master/LICENSE.txt" alt="License">
        <img src="https://img.shields.io/github/license/joneldominic/personal-finance-management-app" /></a>
    <a href="https://github.com/joneldominic/personal-finance-management-app/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/joneldominic/personal-finance-management-app" /></a>
    <a href="https://github.com/joneldominic/personal-finance-management-app/stargazers" alt="Stars">
        <img src="https://img.shields.io/github/stars/joneldominic/personal-finance-management-app" /></a>
    <a href="https://github.com/joneldominic/personal-finance-management-app/network/members" alt="Fork">
        <img src="https://img.shields.io/github/forks/joneldominic/personal-finance-management-app" /></a>
</p>

<p align="center">
    <a href="https://github.com/joneldominic/personal-finance-management-app/issues" alt="Open Issues">
        <img src="https://img.shields.io/github/issues/joneldominic/personal-finance-management-app" /></a>
    <a href="https://github.com/joneldominic/personal-finance-management-app/issues?q=is%3Aissue+is%3Aclosed" alt="Closed Issues">
        <img src="https://img.shields.io/github/issues-closed/joneldominic/personal-finance-management-app" /></a>
    <a href="https://github.com/joneldominic/personal-finance-management-app/pulls" alt="Open PRs">
        <img src="https://img.shields.io/github/issues-pr/joneldominic/personal-finance-management-app" /></a>
    <a href="https://github.com/joneldominic/personal-finance-management-app/pulls?q=is%3Apr+is%3Aclosed" alt="Closed PRs">
        <img src="https://img.shields.io/github/issues-pr-closed/joneldominic/personal-finance-management-app" /></a>
</p>

<p align="center">
    <a href="https://github.com/joneldominic/personal-finance-management-app/graphs/contributors" alt="Contributor">
        <img src="https://img.shields.io/github/contributors/joneldominic/personal-finance-management-app" /></a>
    <a href="https://www.linkedin.com/in/jonel-dominic-tapang-8b5615184/" alt="LinkedIn">
        <img src="https://img.shields.io/badge/LinkedIn-Jonel%20Dominic%20Tapang-blue?logo=LinkedIn" /></a>
</p>

<p align="center">
    <a href="https://flutter.dev/" alt="Flutter">
        <img src="https://img.shields.io/badge/BUILT%20WITH-Flutter-blue?&logo=Flutter&logoWidth=10" /></a>
</p>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->

## About The Project

<br/>

Light Mode            |  Dark Mode
:-------------------------:|:-------------------------:
![Light Mode](images/home-screen-light.png?raw=true "Light Mode ") | ![Dark Mode](images/home-screen-dark.png?raw=true "Dark Mode")

<br/>

<p>
  An open-source, free budgeting app inspired by the popular app, <a href="https://budgetbakers.com/">Wallet</a>. Designed to provide an easy-to-use solution for managing personal finances. The app allows users to categorize expenses, set budgets, and track spending, as well as reach savings goals. With a user-friendly interface, this app is perfect for individuals looking to take control of their finances. In the future, features inspired by other popular apps like <a href="https://www.splitwise.com/">Splitwise</a> and <a href="https://www.budgetwithbuckets.com/">Buckets</a> will be integrated to further enhance the user experience. Contribute to the project and help shape the future of budgeting.
</p>


<!-- GETTING STARTED -->

## Getting Started

1. Install or upgrade to the latest version of Flutter. Follow these installation [guides](https://docs.flutter.dev/get-started/install).
2. Clone the repo:
   ```sh
   git clone https://github.com/joneldominic/personal-finance-management-app.git
   ```
3. Install dependencies:
   ```sh
   flutter pub get 
   ```
4. Run build_runner to generate necessary files (Note: Override formatting as well to avoid unnecessary commit changes):
   ```sh
   flutter pub run build_runner build --delete-conflicting-outputs && flutter format . -l 100
   ```

<!-- USAGE EXAMPLES -->

## Usage

_Video tutorials will be added soon._

<!-- ROADMAP -->

## Roadmap

- [ ] Minimum Viable Product
  - [x] Dark/Light Theme
  - [x] Track transactions
  - [x] Sync account balance with transactions
  - [x] Categorize transactions
  - [x] Track Cashflow
  - [ ] Hardening; Code Clean-up / Refactors; Some Improvements
- [ ] [Buckets](https://www.budgetwithbuckets.com/) features
  - [ ] TODO
- [ ] [Splitwise](https://www.splitwise.com/) features
  - [ ] TODO

See the [open issues](https://github.com/joneldominic/personal-finance-management-app/issues) for a full list of proposed features (and known issues).

More details can also be found on this [Github Project](https://github.com/users/joneldominic/projects/1).

For the design, check this [Figma file](https://www.figma.com/file/Xf0d1yWHngbCS9hI8qwtmB/Personal-Finance-Management-App?node-id=0%3A1&t=EmtBy7v9VOo2sDlI-1).

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks you.

1. [Create an issue](https://github.com/joneldominic/personal-finance-management-app/issues/new)
2. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/{issue#}-issue-title`)
3. Commit your Changes (`git commit -m 'Add some amazing feature'`)
4. Push to the Branch (`git push origin feature/{issue#}-issue-title`)
5. Open a Pull Request

<!-- LICENSE -->

## License

Distributed under the GPL-3.0 License. See `LICENSE.txt` for more information.

<!-- CONTACT -->

## Contact

Jonel Dominic Tapang - [@dom_brave](https://twitter.com/dom_brave) - joneldominictapang.dev@gmail.com

Project Link: [https://github.com/joneldominic/personal-finance-management-app](https://github.com/joneldominic/personal-finance-management-app)

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

- [Flutter](https://flutter.dev/)
- [Stacked](https://pub.dev/packages/stacked) 
- [Isar Database](https://isar.dev/)
- [Othneildrew's Best-README-Template](https://github.com/othneildrew/Best-README-Template)

# Development Quick Guide

## Frequently used commands

- Running Build Runner -
  `flutter pub run build_runner build --delete-conflicting-outputs`

## Note for Isar

- Don't forget to add schema into IsarDatabase

## Formatting

- Format all files with line length 100
  `flutter format . -l 100`

- Run Build Runner + Format
  `flutter pub run build_runner build --delete-conflicting-outputs && flutter format . -l 100`

## Launcher Icon

- Refer to [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) package documentation
  
## Other Tools
- [Custom Icon Generator](https://www.fluttericon.com/)
