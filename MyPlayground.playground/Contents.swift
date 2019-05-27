import UIKit

var str = "Hello, playground"

//변수 선언 : var variable_name = asign variable
//정수를 문자열로 바꾸기 : int --> String String(int variable)
//constant 선언 : let str
//데이터 타입 지정하기 : var str:String

var soi:String
soi = String(3)


print(str)
let a22 = "string"
var a = 1;
var b = 3;
print(a+b);
print(a-b);

str = String(a)
print(str)

str = "this is new string"


var c:Float = 2.3
var d:Double = 13.9
var e:Bool = false
print(round(d))
print(Int(round(d)))

for i in 0...3{
    if(a == i){
        print("found \(i)")
    }
}

func switchPractice(integer : Int) ->Void{
    switch integer {
    case 1:
        print("code is 1")
    case 2:
        print("code is 2")
    default:
        print("default")
    }
    
}
var x : Int
x = 1
switchPractice(integer : 1)
switchPractice(integer : 2)
switchPractice(integer : 4)
//
//for _ in 0...100{
//    print("민지 사랑해")
//}
var sum = 0

//for index in 0...100{
//    sum = sum + index
//
////    print("\(index) : \(sum)")
////
////    while(sum > 3000){
////    print("index is above 3000")
////    }
//}
//print(sum)

func addTwoNumbers(){
    let a = 1;
    let b = 2;
    let c = a + b;
    print(c)
}
addTwoNumbers()

func addTwoNumberss() ->Int{
    let a = 1;
    let b = 2;
    let c = a + b;
    return c;
}
addTwoNumberss()

func addTwoNumbersss(usinglabel a : Int,usingabel b : Int) -> Int{
    let sum : Int = a + b
    return sum
}
print(addTwoNumbersss(usinglabel: 2, usingabel: 3))

//no labelname no datatype
func addTwoNumbersss(_ a : Int,_ b : Int) -> Int{
    let sum : Int = a + b
    return sum
}
print(addTwoNumbersss(2, 3))

//class
class BlogPost{
    var title = ""
    var body = ""
    var author = ""
}
let myPost = BlogPost()
myPost.title = "Harry Potter"
myPost.author = "I don't know"
print(myPost.title)

let post = BlogPost()
post.title = ""

class function{
    func pl(){
        print("I dont")
    }
}

let poste = function()
poste.pl()


class Car {
    var topSpeed = 200
    func drive(){
        print("Driving at \(topSpeed)")
    }
}

class FutureCar : Car{
    
    //super.drive() //original drive
    //override edit func
    
    
    func fly(){
        print("Flying")
    }
}

class Cars : FutureCar{
    
    
}

let cars = FutureCar()
cars.topSpeed = 30
cars.drive()
cars.fly()

class Person{
    var name = ""
    var age = 0
    //initializer
    init() {
        
    }
    
    init(_ name:String ,_ age : Int) {
        //setup object
        self.name = name  //self == this
        self.age = age
        
    }
}

var aw = Person("KimTaeHyeong", 24)
aw.name
aw.age

var sij = Person()
sij.age


class Person1{
    var name = ""
}
class BlogPost1{
    var title:String?  //make empty var
    var body = ""
    var author:Person1? //make empty var
    var numberOfComments = 0
}
let post1 = BlogPost1()
print(post.body + " hello !")

//post1.title = "yo" //execute actualTitle


//Optional Binding
if let actualTitle = post1.title{
    //execute when post1.title has value
    print(actualTitle + "saaa")
}
if post1.title != nil{
    //optional that contains value
    print(post1.title! + "asdsda")
}

//nil initializer check??
class Person2{
    var name = ""
}
class BlogPost3{
    //compyted property
    var fullTitle:String{
        //check title and author are not nil
        if title != nil && author != nil{
            return title! + " by " + author!.name
        }else if title != nil{
            return title!
        }else{
            return "No title"
        }
    }
    var title:String?
    var body = "hey"
    var author:Person2?
    var numberOfComments = 0
}
let author = Person2()
author.name = "Kim TaeHyeong"
let myPost3 = BlogPost3()
myPost3.author = author;
myPost3.title = "Learn Swift for Beginners"
print(myPost3.fullTitle)


//array
var arrayvalue = ["dog","cat","bird"]
for i in 0...arrayvalue.count-1{
    print(arrayvalue[i])
}
for item in arrayvalue{
    print("my " + item)
}

var ee = [Person2]()
var epor = Person2()
epor.name = "Test"
ee.append(epor)
ee.append(epor)

for item in ee{
    print(item.name)
}

// dictionary
var carDB = Dictionary<String, String>()
var carDB2 = [String:String]()

var arrayExample = [String]()

//adding value pair
carDB["JSD 238"] = "Blue Ferrari"
carDB["SID 482"] = "Green Lambo"
//retrieving data
//print(carDB["JSD 238"])

//uodate
carDB["JSD 238"] = "Red Ferrari"

//remove
//["JSD 238"] = nil

//Iterate over it use tuple
for (license, car) in carDB {
    print(license)
    print(car)
}















