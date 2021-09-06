
class FreakCreateValidator < GraphQL::Schema::Validator
  def validate(record)
    p "aaa" if Norm.find(record).nil?
  end
end
