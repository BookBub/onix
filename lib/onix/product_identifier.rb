# coding: utf-8

module ONIX
  class ProductIdentifier
    include ROXML

    xml_name "ProductIdentifier"

    xml_accessor :product_id_type, :from => "ProductIDType", :as => Integer, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :id_value, :from => "IDValue"
  end
end
