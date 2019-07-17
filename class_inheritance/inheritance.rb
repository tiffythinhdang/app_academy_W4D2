class Employee

  attr_accessor :salary, :title, :name, :boss

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
  end

  def add_boss(boss)
    @boss = boss
    boss.subordinate << self
  end



  def bonus(multiplier)
    bonus = (self.salary) * multiplier
  end

end

class Manager < Employee

  attr_accessor :subordinate

  def initialize(name, title, salary)
    super(name, title, salary)
    @subordinate = []
  end

  def bonus(multiplier)
    queue = self.subordinate
    total_salary = 0
    until queue.empty?

      current_staff = queue.shift
      total_salary += current_staff.salary

      if current_staff.class.name == "Manager"
        queue.concat(current_staff.subordinate)
      end

    end
    total_salary * multiplier
  end

end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000)
shawna = Employee.new("Shawna", "TA", 12000)
david = Employee.new("David", "TA", 10000)

darren.add_boss(ned)
shawna.add_boss(darren)
david.add_boss(darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000


