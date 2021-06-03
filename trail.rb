#ask for a list of todos

#puts "what is your next todo?"
#next_todo = gets

#puts "\n\n\n" #carriage return

#puts "[ ] #{next_todo}" #string interpolation

#names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
#new_join = names.map {|name| name.join(' ')}
#print new_join

#books = ["Design as Art", "Anathem", "Shogun"]
#authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
#puts books.map.with_index{|book ,i| "#{book} was written by #{authors[i]}"}

#todos = [
    #["Pay rent", "money"],
    #["Arrange books", "organize"],
    #["Pay taxes", "money"],
    #["Buy groceries", "food"]
 # ]

#organize = Array.new
#food = Array.new
#todos.find {|todo| todo=="money"}

#ruby hashes
#books = ["Design as Art", "Anathem", "Shogun"]
#authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
#hash ={}
#i=0
#authors.each do |author|
 # hash[author[0].to_sym.downcase] = books[i]
#end
#puts hash

=begin
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"]
]

hash={}
hash[":money"]=[]
hash[":food"] =[]
hash[":organize"]=[]

todos.each{|work,name| 
  if "#{name}" == "money"
    hash[":money"].push("#{work}")
  elsif "#{name}" == "organize"
    hash[":organize"].push("#{work}")
  elsif "#{name}" == "food"
    hash[":food"].push("#{work}")
  end
  }
  puts hash
=end

#functions
=begin
def salute(name,salutation)
  names=name.split(' ')
  return "#{salutation.capitalize} Mr. #{names[names.length - 1]}"
end
puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")
=end

=begin
#object oriented programming -> classes
class Student
  def initialize(roll_no, name)
    @roll_no = roll_no
    @name = name
    @is_enrolled = false
  end
  def is_enrolled
    @is_enrolled =  true
  end
  def name
    @name
  end
  def roll_no
    @roll_no
  end
end

class Course
  def initialize(name, students)
    @name = name
    @students = students
  end

  # Add more students even after the object is initialized.
  def enroll(new_student)
    @students.push(new_student)
  end

  def is_student_enrolled?(roll_no)
    @students.any? {|student| student.roll_no == roll_no }
  end

  def get_student(roll_no)
    @students.find {|student| student.roll_no == roll_no }
  end
end

saas = Course.new("SaaS 201", [
  Student.new(15, "Rita"),
  Student.new(79, "ASH")
])

puts saas.is_student_enrolled?(715)
saas.enroll(Student.new(800, "Ned"))
puts saas.is_student_enrolled?(800)   # true
puts saas.get_student(800).name
=end


array = ["value1", "value2"]    
puts array.to_s.gsub('"', '')
