10.times do |blog|
  Blog.create!(
    title: "Blog Post #{blog + 1}",
    body: 'Eleifend ullam, sapiente porro proident pulvinar, voluptates nemo? Natus minus corrupti. Elit curae wisi morbi, reprehenderit, quo, maecenas, sem error? Tellus euismod sapien imperdiet anim, et vero voluptas fugit voluptas, eget aut debitis, feugiat egestas minus, wisi dicta sagittis! Dis.'
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 skills created"

9.times do |portfolio_item|
  PortfolioItem.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: 'My service',
    body: 'Eleifend ullam, sapiente porro proident pulvinar, voluptates nemo? Natus minus corrupti. Elit curae wisi morbi, reprehenderit, quo, maecenas, sem error? Tellus euismod sapien imperdiet anim, et vero voluptas fugit voluptas, eget aut debitis, feugiat egestas minus, wisi dicta sagittis! Dis.',
    image: 'http://placehold.it/600x400',
    thumbnail: 'http://placehold.it/350x200'
  )
end

puts "9 portfolio items created"