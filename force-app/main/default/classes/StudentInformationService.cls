@RestResource(urlMapping='/studentsInfo/*')

global Class StudentInformationService
{

global class StudentInfo 
{
  
   String studentName {get; set;}
   String studentAddress{get; set;}
   String studentPhone{get; set;}
   String SchoolName{get; set;}
}

  @httpGet  
  global static StudentInfo getStudent() 
  
  {
  
  RestRequest request = RestContext.Request;
  String studentId = request.requestURI.subString(request.requestURI.lastIndexOf('/') + 1);
  Student__c student = [Select Id, Name, Address__c, Student_Name__c, Phone_Number__c,School__r.Name From Student__c Where Id = :studentId];
  StudentInfo stdInfo = new StudentInfo();
  stdInfo.studentName = student.student_name__c;
  stdInfo.studentAddress = student.Address__c;
  stdInfo.studentPhone = student.Phone_Number__c;
  stdInfo.SchoolName = student.school__r.Name;
  
  return stdInfo;
  }
}