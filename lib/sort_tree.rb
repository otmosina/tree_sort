# frozen_string_literal: true

require_relative "sort_tree/version"


module SortTree

  def self.walk root
    while root != nil do
      root = self.walk root.left
      p root.value
    end
  end

  def self.fill
    root_arr = []
    root = nil
      [3,2,4,1, 5, 11].each do |v|
        root_arr << root
        root = Tree.new.add(root, v)
      end
    return root, root_arr
  end
  class Error < StandardError; end
  # Your code goes here...

  class Tree
    attr_accessor :left, :right, :value
    def initialize
      @left, @right = nil
      @value = 0
    end

    def add leaf, v
      if leaf == nil
        new_leaf = SortTree::Tree.new
        new_leaf.value = v
        # leaf.value = v
        return new_leaf
      end

      if v < leaf.value
        if leaf.left.nil?
          leaf.left = add(nil, v)
          # return leaf.left
        else
          add(leaf.left, v)
        end
      else
        if leaf.right.nil?
          leaf.right = add(nil, v)
          # return leaf.right
        else
          add(leaf.right, v)
        end
      end
      return leaf
    end

    def self.detour root
      if root == nil
        return nil
      end

      detour(root.left)
      print root.value
      detour(root.right)

    end

  end
end
