import cv2
import numpy as np
from os import listdir
from os.path import isfile, join

data_path = './Datasets/Adeel/'
only_files = [f for f in listdir(data_path) if isfile(join(data_path, f))]

training_data, labels = [],[]

for i, files in enumerate(only_files):
    image_path = data_path + only_files[i]
    images = cv2.imread(image_path,cv2.IMREAD_GRAYSCALE)
    training_data.append(np.asarray(images, dtype=np.uint8))
    labels.append(i)

labels = np.asarray(labels, dtype=np.int32)

model = cv2.face.LBPHFaceRecognizer_create()
model.train(np.asarray(training_data), np.asarray(labels))
model.write('trained_model.yml')
print("Model Trained Successfully")

# Model Training Complete
