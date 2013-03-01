require 'spec_helper'
include WebMock::API

describe "Codesake HTTP verb evaluator" do
  let (:e) {Codesake::HTTP::Evaluate::Verb}

  it "returns a KO if the web cannot be reached" do
    result = Codesake::HTTP::Verb.evaluate("http://i-dont-exist.foo")
    result[:status].should == :KO
  end

  it "returns an OK if the web server is online" do

  end
end
