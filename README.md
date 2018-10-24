# iComponent

This repository is created for the revamp purpose of iComponent framework. Where we categorised all frameworks individually.

## Create Framework with Cocoapods:

Cocoapods is an excellent tool for managing third party dependencies in a project. It not only provides a way for easily integrating those dependencies but also allows you create your own dependencies and manage them as well.

**1. Overview:**
   - In this article I’m going to show you how to develop and distribute in-house private frameworks using Cocoapods. This is known as a private pod and is described in great detail on the [cocoapods site](https://guides.cocoapods.org/making/private-cocoapods.html).
 
**2. Steps to Create Pod Project:**
   - Create your Pod Repository on Github
   - CocoaPods provides a nice utility to help you setup your Pod project along with a test app and testing framework. So to generate your Pod project, just run the following command while standing at your empty github repo directory.
     - ``` pod lib create [POD_NAME] ```
   - After the completion of this command the .workspace project will open up automatically. If it does not, open the .workspace file in the sample project. You will see a ReplaceMe.m file in the pod target.
   - This is the location where you will put the files [.h,.m, .swift] that you want to share with your pod. You will also see the Podspec Metadata folder as well. Next, we need to edit the podspec file.
   - Edit the Podspec File: Run below command before any changes in podspec file
     - ```pod lib lint <Pod_Name>.podspec```
   - It gives error with podspec file. So we’ll need to resolve those issues. To do so, we need to do the following.
     - ```Specify the proper summary of our pod```
     - ```Add some description```
     - ```Replace the <GITHUB_USERNAME> with our Github’s username```
     - ```Specify the proper swift version. Add s.swift_version = ‘4.0’```
     - ```Again run lint process after above steps:```
          - ```pod lib lint <Pod_Name>.podspec```
   - **Necessary steps:**
     - Provide tagging to your Pod with below commands:
       - ```git tag ‘<Version_Number>’```
       - ```git push --tags​​```
   - Add Code in your Pod
     - Since we have created some reusable utility classes and extensions which we want to share with our team, we will drag and drop these files in the folder (i.e. Pod_Folder/Classes).
   
   - Github Setup
     - Create repository on Github and add README.md file.
     - Put iComponentFramwork folder and <Pod_Name>.podspec in your git local repo and commit/ push the same on the github.
 
**3. Add Framework to Cocoapods Repository:**
   - Go to your own framework root folder and run the below command in terminal to register with Cocoapods trunk and it creates the session:
     - [Registration Steps](https://guides.cocoapods.org/making/getting-setup-with-trunk.html)
       - ```pod trunk register <EMAIL_ADDRESS> ‘<USERNAME_WITHOUT_SPACE>’```
     - Run below command to push your framework to CocoaPods repository:
       - ```pod trunk push <podspec_file_name.podspec>```
     - Now we can access our framework with the name as well. Just like Alamofire installation:
       - ```pod ‘Alamofire’```

**4. Steps to Integrate Framework in Our Project:**
   - Run below command at the project’s root folder
     - ```pod init```
   - Then edit podfile and add below lines 
     - To get framework from specific branch then run following command:
       - ```pod ‘iComponentFramwork’, :git => '<GIT_URL>', :branch => '<Branch_Name>'```
     - To get framework by framework_name (If we already added framework in Cocoapods by step #2):
       - ```pod ‘iComponentFramwork’```
     - To get framework from specific branch then run following command:
       - ```pod iComponentFramwork, :git => '<GIT_URL>', :tag => '3.1.1'```
   - [podfile_guide](http://guides.cocoapods.org/using/the-podfile.html#from-a-podspec-in-the-root-of-a-library-repo)
   - Then run pod install command to install pod in your project.

Knowledge Base URL : https://guides.cocoapods.org/making/using-pod-lib-create.html
