3.times do |topic|
  Topic.create!(title: "Topic #{topic}")
end

10.times do |blog|
  Blog.create!(title: "My blog post #{blog}", body: "My Text", topic_id: Topic.last.id)
end

5.times do |skill|
  Skill.create!(title: "Rails #{skill}", percent_utilized: 15)
end

8.times do |portfolio_item|
  Portfolio.create!(title: "Portfolio title: #{portfolio_item}",
                    subtitle: "Ruby on Rails",
                    body: "My Text",
                    main_image: "https://placehold.it/600x400",
                    thumb_image: "https://placehold.it/350x200")
end

1.times do |portfolio_item|
  Portfolio.create!(title: "Portfolio title: #{portfolio_item}",
                    subtitle: "React",
                    body: "My Text",
                    main_image: "https://placehold.it/600x400",
                    thumb_image: "https://placehold.it/350x200")
end

3.times do |technology|
  Portfolio.last.technologies.create!(name: "Technology #{technology}")
end