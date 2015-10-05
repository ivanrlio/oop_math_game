    #contains the methods that generate the questions
class Generator #this works!

  def string(arr)
   puts  "What is the answer to " + arr[0].to_s + arr[2].to_s + arr[1].to_s + "?"
  end

  def operation
    op = ['*', '+', '-']
    op_used = op.sample
    a = rand(20)
    b = rand(20)
    answer = a.send(op_used,b)

    @answer_string = answer.to_s
    return [a, b, op_used]
    
  end

  def answer
    @answer_string
  end

  def question
    string(operation)
  end
end