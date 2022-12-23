### OOP Example - University registry

class Person:
    
    def __init__(self, name = "Jane Smith", uid = "000000"):
        self.name = name
        self.uid = uid

    def __str__(self):
        cls = self.__class__.__name__
        return "{}(name: {}, uid = {})".format(cls, self.name, self.uid)

    def getname(self):
        return self.name

    def setname(self, name):
        self.name = name

    def getuid(self):
        return self.uid

    def setuid(self, uid):
        self.uid = uid

class Employee(Person):

    def __init__(self, title = None, salary = 0, **kwargs):
        super().__init__(**kwargs)
        self.title = title
        self.salary = salary

class Faculty(Employee):

    def __init__(self, dept = None, **kwargs):
        super().__init__(**kwargs)
        self.dept = dept

class Student(Person):

    def __init__(self, major = None, program = "BS", level = "UG", **kwargs):
        super().__init__(**kwargs)
        self.major = major
        self.program = program
        self.level = level

class StudentEmployee(Student, Employee):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

if __name__ == "__main__":
    print("----Testing Person, etc.----")
    jane = Person()
    print(jane)
    john = Employee(name="John Smith", uid="000001")
    print(john)
    mary = Faculty(name="Mary Smith", uid="000002",
        title="Professor", salary=100000)
    print(mary)
    gary = Student(name="Gary Smith", uid="000003",
        major="Data Science", program="MS", level="GR")
    print(gary)
    sara = StudentEmployee(name="Sara Smith", uid="000004",
        major="Data Science", program="MS", level="GR",
        title="TA", salary=50000)
    print(sara)

