class PigLatin
  def initialize input
    @input = input
  end

  def translate
    @input.gsub(/\b\w{1,}\b/) do |a|
      output = ""
      if a[0..1].match(/qu/)
        output = a[2..-1] + "quay"
      elsif a[1..2].match(/qu/)
        output = a[3..-1] + a[0] + "quay"
      elsif not a[0].match(/[aeiou]/)
        initial_consonants = a.slice(/\b[^aeiou]{1,}/)
        output = a.gsub(/\b[^aeiou]{1,}/, "") + initial_consonants + "ay"
      else
        output = a + "ay"
      end
      if a == a.capitalize
        output.capitalize!
      end
      output
    end
  end
end
