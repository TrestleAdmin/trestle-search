Trestle.resource(:continents) do
  menu do
    item :continents, icon: "fa fa-globe-americas"
  end

  search do |q|
    q ? collection.where("LOWER(name) LIKE ?", "%#{q.downcase}%") : collection
  end

  table do
    column :id
    column :name
    actions
  end
end
