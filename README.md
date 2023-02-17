App User Interface:<br>
Designed the user interface of the Flutter app to include a camera button that can be used to take a real-time image.
Implemented a preview screen that displays the captured image to the user and a button to send the image to the Flask API for object detection.

Image Capture and Processing:<br>
Implemented a function to capture the real-time image using the device's camera.
Implemented a function to send the captured image to the Flask API for object detection.
The app waits for the response from the Flask API before proceeding.

Object Detection and Response Handling:<br>
The Flask API receives the image from the app and processes it using the YOLOv5 object detection model.
The API returns the bounding box coordinates and labels of the detected objects to the Flutter app.
Implemented a function to draw bounding boxes on the image using the bounding box coordinates received from the Flask API.
Implemented a function to display the labels of the detected objects at the top of the image.

User Feedback and UI Update:<br>
The final image with the bounding boxes and labels is displayed on the app for the user to see.
The user can then choose to either take another picture or exit the app.
Implemented feedback mechanisms such as progress indicators and error messages to notify the user of the status of image processing and object detection.
Implemented an option to save the image to the device's storage.

Integration:<br>
The Flutter app is integrated with the Flask API and YOLOv5 model to create a complete object detection system.
The system is capable of detecting objects in real-time images captured by the app and displaying the results on the app.
