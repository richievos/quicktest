<<-NOTES
// I want you to write a program that accepts two English words of the same
// length. For example, "HEAD" and "TAIL".

// This program will transform the first word into the second word by changing
// a character at a time using only English words. In this example, "HEAD"
// becomes "HEAL", "TEAL", "TELL", "TALL", "TAIL".

Assumptions:
* start and end are same length (bail if not)
* path may not exist

NOTES

require 'set'


def find_path(start_word, end_word, dictionary_of_possible_words)
    # heal => ["h", "e", "a", "l"]
    start_chars = start_word.chars

    visited = Set.new

    queue = [{ element: start_word, path: [start_word]}]
    loop do
        current = queue.shift()
        break if current.nil?

        element, path = current

        next if visited.include?(element)

        visited << element

        if element == end_word
           return path
        end

        element.each_with_index do |char, i|
            ("a".."z").each do |replacement_char|
               next_word = element.dup
               next_word[i] = replacement_char unless replacement_char == char

               if dictionary_of_possible_words.include?(next_word)
                    next_path = path + [next_word]
                    queue << { element: next_word, path: next_path }
               end
            end
        end
    end

    nil
end

find_path("head", "tail", %w(head heal teal tell tall tail))
