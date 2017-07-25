require 'random_data'

50.times do
  Wiki.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    private: false
  )
end

wikis = Wiki.all


puts "Seed Finished"
puts "#{Wiki.count} wikis created"
