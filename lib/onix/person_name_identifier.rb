# coding: utf-8

module ONIX
  class PersonNameIdentifier
    include ROXML

    xml_name "PersonNameIdentifier"

    xml_accessor :person_name_id_type, :from => "PersonNameIDType", :as => Integer, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :id_type_name,        :from => "IDTypeName"
    xml_accessor :id_value,            :from => "IDValue"
  end
end
