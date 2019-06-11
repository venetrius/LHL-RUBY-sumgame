class Question
  def self.get_question
    number1 = rand(1..20)
    number2 = rand(1..20)
    {"result" => number2 + number1, "question" => "What does #{number1} plus #{number2} equal?"}
  end
end