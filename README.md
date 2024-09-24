# Instagram Clone with SwiftUI

This project is an attempt to clone Instagram's UI using SwiftUI, following the MVVM (Model-View-ViewModel) architecture. Firebase is used for authentication and data storage, although the focus remains on UI replication rather than complete functionality.

## Architecture

- **MVVM (Model-View-ViewModel)**: The application is structured using the MVVM pattern to separate concerns and promote a clean architecture.
- **Firebase**: Integrated for authentication (login and registration) and data storage.
- **Async/Await**: Utilized Swift's modern concurrency features to handle asynchronous operations, such as network requests and Firebase interactions, making the code cleaner and more readable.
- **Task Management**: Implemented `Task` and `async` functions to manage asynchronous tasks and data fetching efficiently.

## Implemented Screens

- **Login** ✅
- **Register** ✅
- **Home** ✅
- **Upload Story** ✅
- **Story** ✅
- **Search** ✅
- **Reels** ✅
- **Profile** ✅
- **Edit Profile** ✅

## Dark Mode

<p>
    <img src="https://github.com/user-attachments/assets/36da143b-ed7b-4f66-9264-9207c0387301" alt="Black-login" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/1a7ff17b-4104-466a-935b-2a8e448cd608" alt="Black-addyourmail" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/2047a1d3-e499-4d45-b273-a3ee6cded03d" alt="Black-username" width="30%" style="display:inline-block;">
</p>
<p>
    <img src="https://github.com/user-attachments/assets/65868835-6c70-4c01-b9e7-50120cb1919f" alt="Black-password" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/40a8d070-fc83-448d-8e98-0da3ab7ed84f" alt="Black-Welcome" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/05cd9f4f-ae53-4646-8a8a-f26389d579e1" alt="BlackHome" width="30%" style="display:inline-block;">
</p>
<p>
    <img src="https://github.com/user-attachments/assets/5fff2482-6718-47ce-b5e3-281e30082d48" alt="BlackUploadStory" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/f1576e18-f3f8-4ee1-bcf5-26815a8e6868" alt="Black-Story" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/364a7d46-c4ca-49c0-8416-439151411b2f" alt="Black TimeLine" width="30%" style="display:inline-block;">
</p>
<p>
    <img src="https://github.com/user-attachments/assets/11fb90b3-d673-45c2-8a16-041c15118d5a" alt="Black-Search" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/088391e1-4edb-4537-8863-efea80253140" alt="Black-Reels" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/2245fb2a-0ba7-48c7-ad71-42b70f5fae5f" alt="Black-Profile" width="30%" style="display:inline-block;">
</p>
<p>
    <img src="https://github.com/user-attachments/assets/8fa06431-28c7-410c-a3aa-c37152b4c510" alt="Black-ShowProfile" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/13c685f3-8b29-4dec-805a-d584358d43cf" alt="Black-EditProfile" width="30%" style="display:inline-block;">
</p>

## Light Mode

<p>
    <img src="https://github.com/user-attachments/assets/e2cdce9e-4615-448d-9c0e-32783249a668" alt="White-login" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/c95678f2-f2d5-4c43-9ebc-4643bf3ba052" alt="White-addyour mail" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/6521802e-9f00-463b-8cc9-6c79a1af5470" alt="White-username" width="30%" style="display:inline-block;">
</p>
<p>
    <img src="https://github.com/user-attachments/assets/632d2d54-521c-4548-b839-3a070e1505f1" alt="White-password" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/9ff7089e-1fd3-4c08-a7ff-2db5e57ca398" alt="White-welcome" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/8c96d4f6-aa10-4dd0-a9d1-4a59c4849908" alt="White-home" width="30%" style="display:inline-block;">
</p>
<p>
    <img src="https://github.com/user-attachments/assets/6728512a-076a-450d-bd46-c8a15ba32926" alt="White-timeline" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/cd668f07-e79d-4283-8608-589f21495bc8" alt="White-search" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/3847514f-4f3f-4ff7-beef-7a8ac0e7cf4e" alt="White-profile" width="30%" style="display:inline-block;">
</p>
<p>
    <img src="https://github.com/user-attachments/assets/e95bb635-576b-4f18-83dc-4d42ae7c530c" alt="White-showprofile" width="30%" style="display:inline-block; margin-right:1%;">
    <img src="https://github.com/user-attachments/assets/655c77b0-22c1-401f-a9cd-1758f5b4a208" alt="White-editprofile" width="30%" style="display:inline-block;">
</p>

## Future Enhancements

Consider adding more functionality to closely replicate Instagram’s features and improve user interaction.
