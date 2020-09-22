class Employee 
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title 
        @salary = salary
        boss.employees << self unless boss == nil
    end

    def bonus(multiplier)
        bonus = self.salary * multiplier
        bonus
    end

end


class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss = nil) #Darren
        super(name, title, salary, boss)
        @employees = []
       
    end 

    def bonus(multiplier)
        salaries = 0
        queue = self.employees
        until queue.empty?
            employee = queue.shift
            salaries += employee.salary 
            queue += employee.employees if employee.is_a?(Manager)
        end
        salaries * multiplier
    end

end

ned = Manager.new("ned", "Founder", 1000000, nil)
darren = Manager.new("darren", "TA Manager", 78000, ned)
shawna = Employee.new("shawna", "TA", 12000, darren)
david = Employee.new("david", "TA", 10000, darren)
p ned.bonus(5)