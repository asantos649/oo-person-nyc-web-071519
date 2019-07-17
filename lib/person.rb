require 'pry'

class Person
attr_reader :name, :happiness, :hygiene
attr_accessor :bank_account

    def initialize (name)
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end

    #refactor to make more DRY
    def happiness= (new_happiness)
        @happiness = new_happiness
        new_happiness <= 0 ? @happiness = 0 : @happiness
        new_happiness >= 10 ? @happiness = 10 : @happiness
    end

    def hygiene= (new_hygiene)
        @hygiene = new_hygiene
        new_hygiene <= 0 ? @hygiene = 0 : @hygiene
        new_hygiene >= 10 ? @hygiene = 10 : @hygiene
    end

    def greater_than_seven(value)
        (value > 7)
    end

    def clean?
        greater_than_seven(@hygiene)
    end

    def happy?
        greater_than_seven(@happiness)
    end

    def get_paid(amount)
        @bank_account += amount
        'all about the benjamins'
    end

    def take_bath
        self.hygiene = 4 + @hygiene
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.hygiene = @hygiene -3
        self.happiness = @happiness + 2
        "♪ another one bites the dust ♫"
    end

    def change_happiness_of_both (friend, change)
        self.happiness = @happiness + change
        friend.happiness = friend.happiness + change
    end


    def call_friend (friend)
        change_happiness_of_both(friend, 3)
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def blah (first_word, second_word)
        "blah blah " + first_word + " blah " + second_word
    end


    def start_conversation (friend, topic)
        
        if topic == "politics"
            change_happiness_of_both(friend, -2)
            blah("partisan","lobbyist")
        elsif topic == "weather"
            change_happiness_of_both(friend, 1)
            blah("sun","rain")
        else 
            blah('blah','blah')
        end

    end
end