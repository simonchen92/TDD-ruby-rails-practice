# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
    attr_reader :first_name, :middle_name, :last_name

    def initialize(first_name:, middle_name: nil, last_name:)
      @first_name = first_name
      @middle_name = middle_name
      @last_name = last_name
    end
    
    #the function .compact only returns everything in the array except for nil elements
    def full_name
        [first_name, middle_name, last_name].compact.join(' ')
    end

    def full_name_with_middle_initial
        [first_name, middle_name ? middle_name[0] : nil, last_name].compact.join(' ')
    end

    def initials
        [first_name[0], middle_name ? middle_name[0] : nil, last_name[0]].compact.join(' ')
    end

  end
  
  RSpec.describe Person do
    describe "#full_name" do
      it "concatenates first name, middle name, and last name with spaces" do
        person = Person.new(first_name: "Simon", middle_name:"Kai", last_name:"Chen")

        expect(person.full_name).to eq("Simon Kai Chen")
      end

      it "does not add extra spaces if middle name is missing" do
        person = Person.new(first_name: "Simon", last_name:"Chen")

        expect(person.full_name).to eq("Simon Chen")
      end
    end
  
    describe "#full_name_with_middle_initial" do
        it "display full name with middle initials" do
            person = Person.new(first_name:"Simon", middle_name:"Kai", last_name:"Chen")

            expect(person.full_name_with_middle_initial).to eq("Simon K Chen")
        end

        it "display full name when not given any middle name" do
            person = Person.new(first_name:"Simon", last_name:"Chen")

            expect(person.full_name_with_middle_initial).to eq("Simon Chen")
        end
    end
  
    describe "#initials" do
        it "display initials of full name" do
            person = Person.new(first_name:"Simon", middle_name:"Kai", last_name:"Chen")

            expect(person.initials).to eq("S K C")
        end

        it "display initials of first and last name if middle name is missing" do
            person = Person.new(first_name:"Simon", last_name:"Chen")

            expect(person.initials).to eq("S C")
        end
    end

  end