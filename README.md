# Background Tasking
Sample code for running a background task to keep iOS applications alive.

# Usage
1. Copy over `BackgroundTaskManager.h` and `BackgroundTaskManager.m`. When creating these files in your project, you will be asked if you wish to create a objective-c briding header. Select yes and copy code over from `background-task-Bridging-Header.h` to the newly created bridging header. 
2. Copy all non-iOS scaffolded code from `ViewController.swift` to create background tasks. 
3. Navigate to your Capabilities and ensure Background Modes is on and Location Updates is checked (if you are using background location tracking). 
