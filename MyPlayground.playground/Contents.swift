import UIKit


//변수 선언 : var variable_name = asign variable (var actually have data type)
//정수를 문자열로 바꾸기 : int --> String String(int variable)
//constant 선언 : let str
//데이터 타입 지정하기 : var str:String


//Naming Conventions




//Protocol and Delegate Pattern exercise
protocol PoliceCodes{
    
    func nineOhTwo()

}

class Officer{
    var radio:PoliceCodes?
    
    func callItIn(){
        radio?.nineOhTwo()
    }
    
}

class Dispatcher: PoliceCodes {
    func nineOhTwo() {
        print("902 received and handled")
    }

}
var o1 = Officer()
let d1 = Dispatcher()
o1.radio = d1
o1.callItIn()



//optional
//Employee name Search Function

var myInt : Int?
var str:String? = "Hello, playGround"

str = nil

class Car1 {}

var myCar : Car1?

//Check if an optional is nul before using it
//Techniqu #1 : Use If to check for nil
if str != nil {
    print(str!)
}
if str == nil {
    //Show a error message to the user
}
//Techniqu #2 : Optional Binding
if let myString = str{
    print(myString)
}

//Declaring variables that can be nil without being an optional
var str2 : String! = "Hello, Playground"
str2 = nil
print(str2)

//its up to you to check it is nil


//Dictionary

//Declaring a Dictionary
var myDictionary = ["key":"data","abc":"value"]

//Declaring an Empty Dictionary
var emptyDictionary = [String:String]() //creating dictionary object

//Accessing an item in the Dictionary
myDictionary["zzz"]
print(myDictionary["key"]!)

//Checking for an item in the Dictionary
if let myString = myDictionary["key"] {
    print(myString)
}

//Adding an item to the Dictionary
myDictionary["newkey"] = "some more data"
if let myString  = myDictionary["newKey"]{
    print(myString)
}

//Updating items in the Dictionary
myDictionary["key"] = "new data"
print(myDictionary["key"]!)

//Removing items from the Dictionary
myDictionary["key"] = nil

//Looping dictionary and array

var array = ["cat","dog","bird"]
var dictionary = ["furball":"cat","mony":"dog","tweetie":"bird"]

//Looping throgh the array
for animal in array {
    print(animal)
}

//Looping through the dictionary
for (name, animal) in dictionary {
    print(name + " " + animal)
    print("\(name) is a \(animal)")
}

//Looping through a range of numbers
for i in 1...array.count {
    print(i)
}

//Looping through the array using a range of numbers
for index in 0..<array.count {
    array[index]
}

//breaking out of a loop
for animal in array{
    print(animal)
    if(animal == "dog"){
        break
    }
}

//Fill an array with 10 random numbers in the range 1-10
//duplicate ok
var array1 = [Int]()
for _ in 1...10{
    let randomnumber = arc4random_uniform(10) + 1
    array1.append(Int(randomnumber))
    //array += [randomnumber]
    print(randomnumber)
}

//no duplicate
array1.removeAll()
repeat {
    
    let randomnumber = arc4random_uniform(10) + 1
    
    if array1.contains(Int(randomnumber)) == false{
        array1.append(Int(randomnumber))
    }
    
    
} while array1.count < 10

for number in array1{
    print(number)
}

while array.count < 10{
    
}








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

















