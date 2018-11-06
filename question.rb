class Question
  def initialize
    @first_number = rand(1..20)
    @second_number = rand(1..20)
  end

  def ask_question
    "What is #{@first_number} + #{@second_number}?"
  end

  def answer
    @first_number + @second_number
  end
end