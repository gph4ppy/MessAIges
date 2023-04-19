# MessAIges
A Messages-like app using GPT API.

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Screenshots](#screenshots)
* [Installation](#installation)
* [Project Status](#project-status)
* [TODOs](#to-do)

## General Information
MessAIgess is an app which combines the logic of ChatGPT and some UI parts from native Messages app for iOS. Thanks to it, the user has a feeling like he or she is writing messages with the artificial inteligence.

## Technologies Used
- SwiftUI
- Core Data
- Combine
- [ChatGPTSwift](https://github.com/alfianlosari/ChatGPTSwift)
- [SwipeActions](https://github.com/aheze/SwipeActions)

## Features
- Write messages with artificial intelligence.
- Save your favorite chats and return to the conversations when they are needed.

## Screenshots
<img src="https://user-images.githubusercontent.com/41966757/233210888-9f8799e3-a315-46ed-b2cb-94d243bbf90b.png" width="300" alt="Chat Screen">

# Installation
1. Clone the repository.
2. Paste the API Key from [OpenAI website](https://platform.openai.com/account/api-keys) into `MessAIges/Supporting Files/APIKeys.xcconfig`.
3. Open the root path of the repository in the terminal and paste this command. Thanks to it, your file with API Key will be ignored by git and your secret won't be committed.
```
git update-index --assume-unchanged MessAIges/Supporting\ Files/APIKeys.xcconfig
```
4. Open `MessAIges.xcodeproj` and run the project.

## Project Status
Project is: _in progress_.

## TODO:
- Clear the message text after sending it, not after receiving the response from AI.
- Implement editing the saved chat (e.g. adding more messages, changing name, etc.).
