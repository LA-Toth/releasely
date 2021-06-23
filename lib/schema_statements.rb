module Releasely
  module SchemaStatements
    def table_names_with_tmp(name1, name2 = nil)
      prefix = name2.nil? ? '' : "#{name1}_"
      name = (name2.nil? ? name1 : name2).to_s
      [(prefix + name).to_sym, "#{prefix}tmp_#{name}".to_sym]
    end
  end
end
