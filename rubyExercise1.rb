=begin
I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((body part)) and ((a noun)).
    ((..))
    ((gem:...))
Our favourite language is Ruby. We think Ruby is better than Emerald.
=end

if __FILE__ == $0

stories = []
stories.push("I had a ((adjective)) sandwich for lunch today. It dripped all over my ((body part)) and ((noun)).")
stories.push("Our favourite language is ((lan:programming language)). We think ((lan)) is better than ((another language)).")
stories.push("I watched ((tv show)) last night. The cameo appearance by ((actor)) was ((adjective)).")
stories.push("Yesterday I found a ((noun)) and a ((different noun)) in ((place)) and used them to make a rocket spaceship.")
stories.push("While crossing the road I got hit by a ((lar:large object)). The force of the ((lar)) broke my ((body part)) and made me feel very ((emotion)).")

rng = Random.new
storyNumber = rng.rand(0..4)
story = stories[storyNumber]

placeholders = Hash.new
index1 = story.index('((')
begin
  index2 = story.index('))',index1)
  placeHolder = story[index1+2..index2-1]
  if placeHolder.include?(':')
      type = placeHolder.split(':')[0]
      thing = placeHolder.split(':')[1]
      puts "Choose a #{thing}:"
      placeholders[type] = gets().chomp
  else
    if (placeholders.keys.include?(placeHolder))
      # Don't need to do anything
    else
      puts "Choose a #{placeHolder}:"
      placeholders[placeHolder] = gets().chomp
    end
  end
  index1 = story.index('((',index2)
end while (index1 != nil)

placeholders.each do |category,choice|
  if /(\({2}.*:[^\)]*\){2})/ =~ story   # If the sentence has a pointer placeholder i.e. ((pointer:type))
    pointer = $1[2,$1.length].split(':')[0]
    story.gsub!("((#{pointer}))",choice)
    story.gsub!(/\({2}.*:[^\)]*\){2}/,choice)
  else
    story.gsub!("((#{category}))",choice)
  end
end

puts(story)

end
