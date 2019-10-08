10.times do |blog|
  Blog.create!(title: "My blog post #{blog}", body: "My Text")
end

5.times do |skill|
  Skill.create!(title: "Rails #{skill}", percent_utilized: 15)
end

9.times do |portfolio_item|
  Portfolio.create!(title: "Portfolio title: #{portfolio_item}",
                    subtitle: "My great service",
                    body: "My Text",
                    main_image: "https://placehold.it/600x400",
                    thumb_image: "https://placehold.it/350x200")
end