class Chef::Recipe
  def to_bin(value)
    value ? '1' : '0'
  end
end
