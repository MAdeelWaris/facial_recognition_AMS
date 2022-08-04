import json
from datetime import datetime
import os
import string
import numpy as np
from uuid import uuid4
import cv2
import time
from django.contrib import messages
from django.core import serializers
from django.forms import model_to_dict
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt

from student_management_app.models import Subjects, SessionYearModel, Students, Attendance, AttendanceReport, \
    Staffs, CustomUser, Courses, NotificationStaffs


def staff_home(request):
    #For Fetch All Student Under Staff
    subjects=Subjects.objects.filter(staff_id=request.user.id)
    course_id_list=[]
    for subject in subjects:
        course=Courses.objects.get(id=subject.course_id.id)
        course_id_list.append(course.id)

    final_course=[]
    #removing Duplicate Course ID
    for course_id in course_id_list:
        if course_id not in final_course:
            final_course.append(course_id)

    students_count=Students.objects.filter(course_id__in=final_course).count()

    #Fetch All Attendance Count
    attendance_count=Attendance.objects.filter(subject_id__in=subjects).count()

    #Fetch All Approve Leave
    staff=Staffs.objects.get(admin=request.user.id)
    #leave_count=LeaveReportStaff.objects.filter(staff_id=staff.id,leave_status=1).count()
    subject_count=subjects.count()

    #Fetch Attendance Data by Subject
    subject_list=[]
    attendance_list=[]
    for subject in subjects:
        attendance_count1=Attendance.objects.filter(subject_id=subject.id).count()
        subject_list.append(subject.subject_name)
        attendance_list.append(attendance_count1)

    students_attendance=Students.objects.filter(course_id__in=final_course)
    student_list=[]
    student_list_attendance_present=[]
    student_list_attendance_absent=[]
    for student in students_attendance:
        attendance_present_count=AttendanceReport.objects.filter(status=True,student_id=student.id).count()
        attendance_absent_count=AttendanceReport.objects.filter(status=False,student_id=student.id).count()
        student_list.append(student.admin.username)
        student_list_attendance_present.append(attendance_present_count)
        student_list_attendance_absent.append(attendance_absent_count)

    return render(request,"staff_template/staff_home_template.html",{"students_count":students_count,"attendance_count":attendance_count,"subject_count":subject_count,"subject_list":subject_list,"attendance_list":attendance_list,"student_list":student_list,"present_list":student_list_attendance_present,"absent_list":student_list_attendance_absent})

def staff_take_attendance(request):
    subjects=Subjects.objects.filter(staff_id=request.user.id)
    session_years=SessionYearModel.object.all()
    # courses=Courses.objects.filter(id=subjects.course_id_id)
    return render(request,"staff_template/staff_take_attendance.html",{"subjects":subjects,"session_years":session_years})

@csrf_exempt
def get_students(request):
    subject_id=request.POST.get("subject")
    session_year=request.POST.get("session_year")
    print("in get student function")

    subject=Subjects.objects.get(id=subject_id)
    session_model=SessionYearModel.object.get(id=session_year)
    students=Students.objects.filter(course_id=subject.course_id,session_year_id=session_model)
    list_data=[]

    for student in students:
        data_small={"id":student.admin.id,"name":student.admin.first_name+" "+student.admin.last_name}
        list_data.append(data_small)
    print(list_data)
    return JsonResponse(json.dumps(list_data),content_type="application/json",safe=False)

@csrf_exempt
def detect_faces(request):
    print("in detect Faces Part")
    
    student_ids=request.POST.get("student_ids")
    subject_id=request.POST.get("subject_id")
    session_year_id=request.POST.get("session_year_id")
    json_sstudent=json.loads(student_ids)
    print(subject_id)
    print(session_year_id)
    print(json_sstudent)
    face_matched_id=[]
    count=0
    try:
        subject_object=Subjects.objects.get(id=subject_id)
        course_id=subject_object.course_id_id
        print(course_id)
        # for stud in json_sstudent:
        #     student=Students.objects.get(admin=stud['id'])
        student=Students.objects.get(admin=json_sstudent[0]['id'])   
        print(student)
        # student_id=student.admin.username
        # student_first=student.admin.first_name
        # student_last=student.admin.last_name
            
            
        matched_id=recognize_student(session_year_id,course_id)
        print(matched_id)

        # if(match):
        #     face_matched_id.append(json_sstudent[0]['id'])
        #     count=count+1
        
        # print(face_matched_id)    
        return JsonResponse(json.dumps(matched_id),content_type="application/json",safe=False)
    except:
        return HttpResponse("ERR")


def recognize_student(session_year_id,course_id):

    
    print("entered into recognize function")
    face_classifier=cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
    print("file accessed")
    model = cv2.face.LBPHFaceRecognizer_create()
    # course_id_str=course_id+""

    print("ready to read model file")
    print(course_id)
    print(session_year_id)
    
    model_path_read_file='./model_files/'+str(course_id)+session_year_id+'.yml'
    print(model_path_read_file)
    if not os.path.exists(model_path_read_file):
        return False
    model.read(model_path_read_file)
    face_matched_id=[]
    
    print("model read")

    font = cv2.FONT_HERSHEY_SIMPLEX
    cam=cv2.VideoCapture(0)
    address="http://192.168.0.102:8080/video"
    cam.open(address)
    

    while True:

        ret, im =cam.read()
        gray = cv2.cvtColor(im,cv2.COLOR_BGR2GRAY)
        faces = face_classifier.detectMultiScale(gray, 1.2,5)

        for(x,y,w,h) in faces:
            cv2.rectangle(im, (x-20,y-20), (x+w+20,y+h+20), (0,255,0), 4)
            Labels, confidence = model.predict(gray[y:y+h,x:x+w])
            userdata_get=CustomUser.objects.get(id=Labels)
            userdata_fname=userdata_get.first_name
            userdata_lname=userdata_get.last_name
            # print(userdata_fname)
            face_matched_id.append(Labels)
            
            #Id = "Varun {0:.2f}%".format(round(100 - confidence, 2))
            # # Put text describe who is in the picture
            # elif Id == 2 :
            #     Id = "Amartya {0:.2f}%".format(round(100 - confidence, 2))
            # # Put text describe who is in the picture
            # elif Id == 3:
            #     Id = "Darshan {0:.2f}%".format(round(100 - confidence, 2))
            # else:
            #     pass

            cv2.rectangle(im, (x-22,y-90), (x+w+22, y-22), (0,255,0), -1)
            cv2.putText(im, userdata_fname+' '+userdata_lname+' : Attendance Marked', (x,y-40), font, 1, (255,255,255), 3)

        cv2.imshow('Attendance Management System',im) 
        if cv2.waitKey(1)==13:
            break

    face_matched_id_removed_duplication=list(dict.fromkeys(face_matched_id))
    # print(face_matched_id_removed_duplication)
    cam.release()
    cv2.destroyAllWindows()
    return face_matched_id_removed_duplication

    




    # def face_detector(img, size = 0.5):
    #     #print("in face detector function")
    #     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    #     #print("gray converted now detecting multiscale")
    #     faces = face_classifier.detectMultiScale(gray, 1.3,5)
    #     #print("detected multiscale")

    #     if faces is ():
    #         return img,[]

    #     #print("shaping frame")

    #     for(x,y,w,h) in faces:
    #         cv2.rectangle(img, (x,y), (x+w,y+h), (0,255,0),2)
    #         roi = img[y:y+h, x:x+w]
    #         roi = cv2.resize(roi, (200,200))

    #     return img, roi

    # #print("open camera")
    # cap=cv2.VideoCapture(0)
    # address="http://192.168.18.14:8080/video"
    # cap.open(address)
    # #print("address fetched now entering into loop")

    # while True:
    #     ret, frame = cap.read()
    #     #print("starting face detection")
    #     image, face = face_detector(frame)
    #     #print("in loop frame fetched")

    #     try:
    #         face = cv2.cvtColor(face, cv2.COLOR_BGR2GRAY)
    #         result = model.predict(face)
            
    #         cv2.putText(image, "Press Enter to Exit", (20, 70), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255), 2)

    #         if result[1] < 500:
    #             confidence = int(100 * (1-(result[1])/300))

            


    #         if confidence > 75:
    #             display_string = str(confidence) + '% accuracy'
    #             student_id_path = 'Face Matched' 
                
    #             cv2.putText(image, display_string, (100, 120), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 255, 0), 2)
    #             cv2.putText(image, student_id_path, (250, 450), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 255, 0), 2)
    #             cv2.imshow('Face Cropped', image)
    #             match=True
    #         else:

    #             cv2.putText(image, 'Low Accuracy.Kindly align your face.', (100, 120), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 255, 0), 2)
    #             cv2.putText(image, "Face Not Matched", (250, 450), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255), 2)
    #             cv2.imshow('Face Cropped', image)
    #     except:
    #         cv2.putText(image, "Face Not Found", (250, 450), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255), 2)
    #         cv2.imshow('Face Cropped', image)
    #         pass

    #     if cv2.waitKey(1)==13:
    #         break
    
    # cap.release()
    # cv2.destroyAllWindows()
    




@csrf_exempt
def save_attendance_data(request):
    student_ids=request.POST.get("student_ids")
    subject_id=request.POST.get("subject_id")
    attendance_date=request.POST.get("attendance_date")
    session_year_id=request.POST.get("session_year_id")

    subject_model=Subjects.objects.get(id=subject_id)
    session_model=SessionYearModel.object.get(id=session_year_id)
    json_sstudent=json.loads(student_ids)
    #print(data[0]['id'])


    try:
        attendance=Attendance(subject_id=subject_model,attendance_date=attendance_date,session_year_id=session_model)
        attendance.save()

        for stud in json_sstudent:
             student=Students.objects.get(admin=stud['id'])
             attendance_report=AttendanceReport(student_id=student,attendance_id=attendance,status=stud['status'])
             attendance_report.save()
        return HttpResponse("OK")
    except:
        return HttpResponse("ERR")

def staff_update_attendance(request):
    subjects=Subjects.objects.filter(staff_id=request.user.id)
    session_year_id=SessionYearModel.object.all()
    return render(request,"staff_template/staff_update_attendance.html",{"subjects":subjects,"session_year_id":session_year_id})

@csrf_exempt
def get_attendance_dates(request):
    subject=request.POST.get("subject")
    session_year_id=request.POST.get("session_year_id")
    subject_obj=Subjects.objects.get(id=subject)
    session_year_obj=SessionYearModel.object.get(id=session_year_id)
    attendance=Attendance.objects.filter(subject_id=subject_obj,session_year_id=session_year_obj)
    attendance_obj=[]
    for attendance_single in attendance:
        data={"id":attendance_single.id,"attendance_date":str(attendance_single.attendance_date),"session_year_id":attendance_single.session_year_id.id}
        attendance_obj.append(data)

    return JsonResponse(json.dumps(attendance_obj),safe=False)

@csrf_exempt
def get_attendance_student(request):
    attendance_date=request.POST.get("attendance_date")
    attendance=Attendance.objects.get(id=attendance_date)

    attendance_data=AttendanceReport.objects.filter(attendance_id=attendance)
    list_data=[]

    for student in attendance_data:
        data_small={"id":student.student_id.admin.id,"name":student.student_id.admin.first_name+" "+student.student_id.admin.last_name,"status":student.status}
        list_data.append(data_small)
    return JsonResponse(json.dumps(list_data),content_type="application/json",safe=False)

@csrf_exempt
def save_updateattendance_data(request):
    student_ids=request.POST.get("student_ids")
    attendance_date=request.POST.get("attendance_date")
    attendance=Attendance.objects.get(id=attendance_date)

    json_sstudent=json.loads(student_ids)


    try:
        for stud in json_sstudent:
             student=Students.objects.get(admin=stud['id'])
             attendance_report=AttendanceReport.objects.get(student_id=student,attendance_id=attendance)
             attendance_report.status=stud['status']
             attendance_report.save()
        return HttpResponse("OK")
    except:
        return HttpResponse("ERR")

def staff_profile(request):
    user=CustomUser.objects.get(id=request.user.id)
    staff=Staffs.objects.get(admin=user)
    return render(request,"staff_template/staff_profile.html",{"user":user,"staff":staff})

def staff_profile_save(request):
    if request.method!="POST":
        return HttpResponseRedirect(reverse("staff_profile"))
    else:
        first_name=request.POST.get("first_name")
        last_name=request.POST.get("last_name")
        address=request.POST.get("address")
        password=request.POST.get("password")
        try:
            customuser=CustomUser.objects.get(id=request.user.id)
            customuser.first_name=first_name
            customuser.last_name=last_name
            if password!=None and password!="":
                customuser.set_password(password)
            customuser.save()

            staff=Staffs.objects.get(admin=customuser.id)
            staff.address=address
            staff.save()
            messages.success(request, "Successfully Updated Profile")
            return HttpResponseRedirect(reverse("staff_profile"))
        except:
            messages.error(request, "Failed to Update Profile")
            return HttpResponseRedirect(reverse("staff_profile"))

@csrf_exempt
def staff_fcmtoken_save(request):
    token=request.POST.get("token")
    try:
        staff=Staffs.objects.get(admin=request.user.id)
        staff.fcm_token=token
        staff.save()
        return HttpResponse("True")
    except:
        return HttpResponse("False")

def staff_all_notification(request):
    staff=Staffs.objects.get(admin=request.user.id)
    notifications=NotificationStaffs.objects.filter(staff_id=staff.id)
    return render(request,"staff_template/all_notification.html",{"notifications":notifications})

