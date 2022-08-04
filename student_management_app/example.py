from os import listdir, name
import cv2
import numpy as np
import os
from os.path import isfile, join
from PIL import Image

# def fetch_frames():
#     print("entered in function")
#     face_classifier=cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

#     def face_extractor(img):
#         gray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
#         faces=face_classifier.detectMultiScale(gray,1.3,5)

#         if faces is ():
#             return None

#         for(x,y,w,h) in faces:
#             cropped_face=img[y:y+h,x:x+w]

#             return cropped_face

#     cap=cv2.VideoCapture(0)
#     print("following address")
#     address="http://192.168.18.14:8080/video"
#     cap.open(address)
#     count=0
#     print("address opened")

#     while True:
#         print("entered in loop")
#         ret,frame=cap.read()
#         print("read frame")
#         if face_extractor(frame) is not None:
#             count+=1
#             face=cv2.resize(face_extractor(frame),(200,200))
#             print("converting to gray")
#             face=cv2.cvtColor(face,cv2.COLOR_BGR2GRAY)
#             print("storing to dataset folder")
            
#             directory='../student1/'
#             if not os.path.exists(directory):
#                 os.makedirs(directory)

#             file_name_path = directory+'student50_'+str(count)+'.jpg'
#             cv2.imwrite(file_name_path,face)
#             print("picture stored")

#             cv2.putText(face,str(count),(50,50),cv2.FONT_HERSHEY_SIMPLEX,1,(0,255,0),2)
#             cv2.imshow('Face Cropped',face)
#         else:
#             # print('Face not Found')
#             pass

#         if cv2.waitKey(1)==13 or count==50:
#             break
#     cap.release()
#     cv2.destroyAllWindows()
#     print("Sample Collected")

# def train_model():

    
#     data_path = '../student1/'
#     only_files = [f for f in listdir(data_path) if isfile(join(data_path, f))]
#     print("getting files from dataset")

#     training_data, labels = [],[]

#     print("entering in loop")
#     for i, files in enumerate(only_files):
#         image_path = data_path + only_files[i]
#         images = cv2.imread(image_path,cv2.IMREAD_GRAYSCALE)
#         training_data.append(np.asarray(images, dtype=np.uint8))
#         label_cut=files.split("_")[0]
#         print(label_cut)
#         labels.append(label_cut)

#     labels = np.asarray(labels, dtype=str)
#     print(labels)
#     print("Loop Ended now storing model file")

#     model = cv2.face.LBPHFaceRecognizer_create()
#     print("using library")
#     model.train(np.asarray(training_data), np.asarray(labels))
    
#     model.write('../student1.xml')
#     print("Model Trained Successfully")

# def train_model2():
#     print("entered into train model function")

#     recognizer = cv2.face.LBPHFaceRecognizer_create()
#     print("step 1")

# # For detecting the faces in each frame we will use Haarcascade Frontal Face default classifier of OpenCV
#     detector = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")
#     print("step 2")
    


# #method getting the images and label data

#     def getImagesAndLabels(path):
#         print("step 3")

#     # Getting all file paths
#         imagePaths = [os.path.join(path,f) for f in os.listdir(path)] 
#         print("step 4")
    
#     #empty face sample initialised
#         faceSamples=[]
    
#     # IDS for each individual
#         ids = []

#     # Looping through all the file path
#         for imagePath in imagePaths:
#             print("step 5")

#         # converting image to grayscale
#             PIL_img = Image.open(imagePath).convert('L')
#             print("step 6")

#         # converting PIL image to numpy array using array() method of numpy
#             img_numpy = np.array(PIL_img,'uint8')
#             print("step 6 1")

#         # Getting the image id
#             id = int(os.path.split(imagePath)[-1].split("_")[0])
#             print(id)
#             print("step 6 2")

#         # Getting the face from the training images
#             faces = detector.detectMultiScale(img_numpy)
#             print("step 6 3")

#         # Looping for each face and appending it to their respective IDs
#             for (x,y,w,h) in faces:
#                 print("step 6 4")

#             # Add the image to face samples
#                 faceSamples.append(img_numpy[y:y+h,x:x+w])
#                 print("step 6 5")

#             # Add the ID to IDs
#                 ids.append(id)
#                 print("step 7")

#     # Passing the face array and IDs array
#         return faceSamples,ids

# # Getting the faces and IDs
#     data_path = '../dataset/3/1'
#     faces,ids = getImagesAndLabels(data_path)
#     print("step 8")

# # Training the model using the faces and IDs
#     recognizer.train(faces, np.array(ids))
#     print("step 9")

# # Saving the model into s_model.yml
#     print("step 10")
    
#     recognizer.write('../model_files/31.xml')
#     print("step 11")

# train_model2()

def train_model():
    print("entered into train model function")

    recognizer = cv2.face.LBPHFaceRecognizer_create()
    print("step 1")

# For detecting the faces in each frame we will use Haarcascade Frontal Face default classifier of OpenCV
    detector = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
    print("step 2")
    


#method getting the images and label data

    def getImagesAndLabels(path):
        print("step 3")

    # Getting all file paths
        imagePaths = [os.path.join(path,f) for f in os.listdir(path)] 
        print("step 4")
    
    #empty face sample initialised
        faceSamples=[]
    
    # IDS for each individual
        ids = []

    # Looping through all the file path
        for imagePath in imagePaths:
            print("step 5")

        # converting image to grayscale
            PIL_img = Image.open(imagePath).convert('L')
            print("step 6")

        # converting PIL image to numpy array using array() method of numpy
            img_numpy = np.array(PIL_img,'uint8')
            print("step 6 1")

        # Getting the image id
            id = int(os.path.split(imagePath)[-1].split("_")[0])
            print(id)
            print("step 6 2")

        # Getting the face from the training images
            faces = detector.detectMultiScale(img_numpy)
            print("step 6 3")

        # Looping for each face and appending it to their respective IDs
            for (x,y,w,h) in faces:
                print("step 6 4")

            # Add the image to face samples
                faceSamples.append(img_numpy[y:y+h,x:x+w])
                print("step 6 5")

            # Add the ID to IDs
                ids.append(id)
                print("step 7")

    # Passing the face array and IDs array
        return faceSamples,ids

# Getting the faces and IDs
    data_path = '../dataset/1/1/'
    faces,ids = getImagesAndLabels(data_path)
    print("step 8")

# Training the model using the faces and IDs
    recognizer.train(faces, np.array(ids))
    print("step 9")

# Saving the model into s_model.yml
    print("step 10")
    
    recognizer.write('../model_files/11.yml')
    #print("step 11")

    # data_path = './dataset/'+course_id+'/'+session_id+'/'
    # only_files = [f for f in listdir(data_path) if isfile(join(data_path, f))]
    # print("getting files from dataset")

    # training_data, labels = [],[]

    # print("entering in loop")
    # for i, files in enumerate(only_files):
    #     image_path = data_path + only_files[i]
    #     images = cv2.imread(image_path,cv2.IMREAD_GRAYSCALE)
    #     training_data.append(np.asarray(images, dtype=np.uint8))
    #     label_cut=files.split("_")[0]
    #     #print(label_cut)
    #     labels.append(label_cut)

    
    
    # print("Loop Ended now storing model file")
    # print(training_data)
    # print(np.array(labels))

    # model = cv2.face.LBPHFaceRecognizer_create()
    # print("using library")
    # model.train(training_data, np.array(labels))

    # model.write('./model_files/'+course_id+session_id+'.xml')
    print("Model Trained Successfully")

    # Model Training Complete
train_model()