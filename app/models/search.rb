def self.search(keyword)
  if keyword.present?
    where('title LIKE ?', "#{keyword}%")
  else
    all
  end
end