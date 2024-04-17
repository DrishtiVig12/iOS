/*:
## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() -> Void {
        print(self.title)
        print(self.author)
        print(self.pages)
        print(self.price)
    }
    
}

var favoriteBook = Book(title: "The Little Prince", author: "Antoine de Saint Expury", pages: 88, price: 250)
favoriteBook.description()
//:  A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    mutating func like () -> Void{
        likes += 1
    }
}

var newPost = Post(message: "Hello", likes: 0, numberOfComments: 0)
print(newPost.likes)
newPost.like()
print(newPost.likes)



/*:
[Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
 */
