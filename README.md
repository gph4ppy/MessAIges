# MessAIges
A Messages-like app using ChatGPT

# Installation
1. Clone the repository.
2. Paste the API Key from [OpenAI website](https://platform.openai.com/account/api-keys) into `MessAIges/Supporting Files/APIKeys.xcconfig`.
3. Open root path of the repository in the terminal and paste this command. Thanks to it, your file with API Key will be ignored by git and your secret won't be commited.
```
git update-index --assume-unchanged MessAIges/Supporting\ Files/APIKeys.xcconfig
```
4. Open `MessAIges.xcodeproj` and run the project.
