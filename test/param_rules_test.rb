
require 'accept_params/param_rules'

context "ParamRules object" do
  
  setup do 
    p = AcceptParams::ParamRules.new({})
    p.integer :integer, :minvalue => 5, :maxvalue => 7, :required => true
    p
  end
  

  asserts("complains about missing param") {topic.validate({})}
  asserts("complains about extra param") {topic.validate({"integer" => 6, "string" => "123"})}
  
  asserts("a valid value in range") { topic.validate({"integer" => 6})}
  asserts("a valid string value in range") { topic.validate({"integer" => "6"})}
  denies("a value higher than max") { topic.validate({"integer" => 7})}
  denies("a value lower than min") { topic.validate({"integer" => 4})}
  asserts("a float value in range") { topic.validate({"integer" => "5.5"})}
  asserts("a float value out of range") {topic.validate({"integer" => "7.7"})}
  
  
end