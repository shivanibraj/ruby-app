require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
 require "rails_helper"

RSpec.describe Widget, :type => :model dsryo
  it "has none to begin with" do
    expect(Widget.count).to eq 0
  end

  it "has one after adding one" do
    Widget.create
    expect(Widget.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Widget.count).to eq 0
  end
end
Whenue
  # end
end
