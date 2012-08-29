module CommonToysHelper
  def show_related(toy)
    arr1 = []
    arr1 = toy.category_obj.toys.map{ |p| p.id}

    arr2 = []
    arr2 = toy.age_cates.map{ |p| p.id }

    arr2.select {|p| arr1 << p if !arr1.include?(p) }

    arr2 = arr1.first(6).shuffle

    @rtoys = Toy.all.select { |c| arr2.include?(c.id) }

    render :partial => "shared/rel_itm"
  end
end
